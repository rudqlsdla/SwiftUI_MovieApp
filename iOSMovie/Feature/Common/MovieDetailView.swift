//
//  MovieDetailView.swift
//  iOSMovie
//
//  Created by 임경빈 on 1/24/24.
//

import Kingfisher
import SwiftUI

struct MovieDetailView: View {
  let movie: Datum
  
  var body: some View {
    VStack {
      KFImage(URL(string: "https://image.tmdb.org/t/p/w780/\(movie.backdropPath)"))
        .placeholder {
          Image(systemName: "movieclapper")
        }
        .fade(duration: 1)
        .resizable()
        .aspectRatio(16/9, contentMode: .fit)
        .overlay(
          LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.5)]),
                         startPoint: .top,
                         endPoint: .bottom)
        )
      
      VStack {
//        Text(movie.title)
//          .multilineTextAlignment(.center)
//          .font(.title)
//        
        Text(movie.releaseDate)
          .font(.caption)
      }
      
      Spacer()
    }
    .navigationTitle(movie.title)
    .navigationBarTitleDisplayMode(.inline)
  }
}
