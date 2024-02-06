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
  @State private var topRatedMovieList: [Movie] = []
  @State private var isLoading = false
  
  var body: some View {
    ZStack {
      if isLoading {
        LottieView(animation: .named("Loading_Lottie"))
          .looping()
          .scaleEffect(4)
      }
      VStack(spacing: 7) {
        BestMovieTextView()
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
  struct BestMovieTextView: View {
    var body: some View {
      HStack {
        Group {
          VStack(alignment: .leading, spacing: 0) {
            Text("We have")
            HStack {
              Text("selected")
              Text("Best")
                .font(.system(size: 40, weight: .bold))
                .foregroundStyle(.black121244)
            }
            HStack {
              Text("Movies")
                .font(.system(size: 40, weight: .bold))
                .foregroundStyle(.black121244)
              Text("for you")
            }
          }
        }
        .foregroundStyle(.black)
        .font(.system(size: 40, weight: .semibold))
        .padding(.leading, 28)
        Spacer()
      }
    }
  }
  
  struct PageView: View {
    @State private var selectedMovie: Movie?
    @State private var snappedItem = 0.0
    @State private var draggingItem = 0.0
    @Binding var topRatedMovieList: [Movie]
    
    var body: some View {
      ZStack {
        ForEach(topRatedMovieList) { movie in
          // article view
          VStack {
            KFImage(URL(string: "https://image.tmdb.org/t/p/w342/\(movie.posterPath)"))
//              .resizable()
              .scaledToFit()
              .clipShape(.rect(cornerRadius: 10))
              .shadow(color: .black.opacity(0.2), radius: 8)
          }
          .scaleEffect(1.0 - abs(distance(movie.index)) * 0.2 )
          .opacity(1.0 - abs(distance(movie.index)) * 0.3 )
          .offset(x: myXOffset(movie.index), y: 0)
          .zIndex(1.0 - abs(distance(movie.index)) * 0.1)
          .onTapGesture {
            selectedMovie = movie
          }
        }
        .sheet(item: $selectedMovie) { selectedMovie in
          MovieDetailView(movie: selectedMovie)
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
