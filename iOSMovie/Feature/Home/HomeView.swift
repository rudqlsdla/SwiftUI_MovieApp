//
//  HomeView.swift
//  iOSMovie
//
//  Created by 임경빈 on 1/3/24.
//

import Kingfisher
import Lottie
import SwiftUI

struct HomeView: View {
  @State private var topRatedMovieList: [Datum] = []
  @State private var isLoading = false
  
  var body: some View {
    ZStack {
      if isLoading {
        LottieView(animation: .named("Loading_Lottie"))
          .looping()
          .scaleEffect(4)
      }
      VStack {
        PageView(topRatedMovieList: $topRatedMovieList)
        Spacer()
      }
      .onAppear {
        Task {
          do {
            isLoading.toggle()
            topRatedMovieList = try await MovieClient().getTopRatedMovie()
            for index in 0..<topRatedMovieList.count {
              print(topRatedMovieList[index])
              topRatedMovieList[index].index = index
              print(topRatedMovieList[index])
            }
            isLoading.toggle()
          } catch {
            print(error)
          }
        }
      }
    }
  }
}

extension HomeView {
  struct PageView: View {
    @State private var snappedItem = 0.0
    @State private var draggingItem = 0.0
    @Binding var topRatedMovieList: [Datum]
    
    var body: some View {
      
      //      TabView {
      //        ForEach(topRatedMovieList) { movie in
      //          KFImage(URL(string: "https://image.tmdb.org/t/p/w500/\(movie.backdropPath)"))
      //            .placeholder {
      //              Image(systemName: "movieclapper")
      //            }
      //            .fade(duration: 1)
      //            .resizable()
      //            .overlay(
      //              LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.5)]),
      //                             startPoint: .top,
      //                             endPoint: .bottom)
      //            )
      //        }
      //      }
      //      .frame(width: width, height: 400)
      //      .tabViewStyle(PageTabViewStyle())
      //
      ZStack {
        ForEach(topRatedMovieList) { movie in
          
          // article view
          VStack {
            KFImage(URL(string: "https://image.tmdb.org/t/p/w500/\(movie.posterPath)"))
              .resizable()
              .frame(width: 250, height: 500)
              .scaledToFit()
              .clipShape(.rect(cornerRadius: 3))
            Text(movie.title)
              .font(.title)
          }
          .scaleEffect(1.0 - abs(distance(movie.index)) * 0.2 )
          .opacity(1.0 - abs(distance(movie.index)) * 0.3 )
          .offset(x: myXOffset(movie.index), y: 0)
          .zIndex(1.0 - abs(distance(movie.index)) * 0.1)
        }
      }
      .gesture(
        DragGesture()
          .onChanged { value in
            draggingItem = snappedItem + value.translation.width / 100
          }
          .onEnded { value in
            withAnimation {
              draggingItem = snappedItem + value.predictedEndTranslation.width / 100
              draggingItem = round(draggingItem).remainder(dividingBy: Double(topRatedMovieList.count))
              snappedItem = draggingItem
            }
          }
      )
    }
    
    func distance(_ item: Int) -> Double {
      return (draggingItem - Double(item)).remainder(dividingBy: Double(topRatedMovieList.count))
    }
    
    func myXOffset(_ item: Int) -> Double {
      let angle = Double.pi * 2 / Double(topRatedMovieList.count) * distance(item)
      return sin(angle) * 200
    }
  }
}
