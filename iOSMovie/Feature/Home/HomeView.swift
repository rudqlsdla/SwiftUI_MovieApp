//
//  HomeView.swift
//  iOSMovie
//
//  Created by 임경빈 on 1/3/24.
//

import Lottie
import SwiftUI

struct HomeView: View {
  @State private var topRatedMovieList: [Datum] = []
  @State private var isLoading = false
  
  var body: some View {
    ZStack {
      Color.blue.opacity(0.3)
        .ignoresSafeArea(.all)
      
      if isLoading {
        LottieView(animation: .named("Loading_Lottie"))
          .looping()
          .scaleEffect(4)
      }
      
      ScrollView(.horizontal) {
        HStack {
          ForEach(topRatedMovieList) { movie in
            VStack {
              Text("\(movie.title)")
              Text("\(movie.popularity)")
              Text("\(movie.releaseDate)")
            }
          }
        }
      }
      .background(.green)
      .task {
        do {
          isLoading.toggle()
          topRatedMovieList = try await MovieClient().getTopRatedMovie()
          isLoading.toggle()
        } catch {
          print(error)
        }
      }
    }
  }
}

#Preview {
  HomeView()
}
