//
//  MovieDetailView.swift
//  iOSMovie
//
//  Created by 임경빈 on 1/24/24.
//

import ExpandableText
import Kingfisher
import SwiftUI

struct MovieDetailView: View {
  let movie: Movie
  @State private var genreList: [String] = []
  @State private var detailText: String = ""
  
  var body: some View {
    VStack(spacing: 10) {
      KFImage(URL(string: "https://image.tmdb.org/t/p/w1280/\(movie.backdropPath)"))
        .placeholder {
          Image(systemName: "movieclapper")
        }
        .fade(duration: 1)
        .resizable()
        .aspectRatio(16/9, contentMode: .fit)
        .clipShape(.rect(cornerRadius: 20))
//        .overlay(
//          LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.5)]),
//                         startPoint: .top,
//                         endPoint: .bottom)
//        )
      
      VStack(spacing: 8) {
        Text(movie.title)
          .multilineTextAlignment(.center)
          .font(.system(size: 24, weight: .bold))
        
        Text(detailText)
          .font(.system(size: 14, weight: .light))
        
        ExpandableText(text: movie.overview)
          .font(.system(size: 14, weight: .regular))
          .lineLimit(3)
          .expandButton(TextSet(text: "more", font: .body, color: .blue))
          .collapseButton(TextSet(text: "less", font: .body, color: .blue))
          .expandAnimation(.easeOut(duration: 0.5))
      }
      Spacer()
    }
    .padding(20)
    .onAppear {
      genreList = GenreInfo.shared.idToName(idArray: movie.genreIDS)
      for genre in genreList {
        detailText += genre + " · "
      }
      detailText += movie.releaseDate
    }
  }
}
