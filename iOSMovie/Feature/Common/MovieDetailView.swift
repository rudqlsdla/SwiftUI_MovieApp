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
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .fade(duration: 1)
        .overlay(
          LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.5)]),
                         startPoint: .top,
                         endPoint: .bottom)
        )
      
      Text(movie.title)
        .font(.title)
      
      Text(movie.releaseDate)
        .font(.caption)
      
      Spacer()
    }
  }
}
