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
  @State private var movieInfo: MovieInfo?
  @State private var genreList: [String] = []
  @State private var genreText: String = ""
  @State private var detailText: String = ""
  
  let movie: Movie
  let closeAction: () -> Void
  
  var body: some View {
    VStack(spacing: 0){
      DetailHeaderView(closeAction: closeAction)
      ScrollView {
        VStack(spacing: 10) {
          KFImage(URL(string: "https://image.tmdb.org/t/p/w1280/\(movie.backdropPath)"))
            .placeholder {
              Image(systemName: "movieclapper")
            }
            .fade(duration: 0.3)
            .resizable()
            .aspectRatio(16/9, contentMode: .fit)
            .clipShape(.rect(cornerRadius: 20))
            .shadow(color: .black.opacity(0.5), radius: 5)
          //        .overlay(
          //          LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.5)]),
          //                         startPoint: .top,
          //                         endPoint: .bottom)
          //        )
          
          VStack(spacing: 8) {
            Text(movie.title)
              .multilineTextAlignment(.center)
              .font(.system(size: 24, weight: .bold))
            
            Text(genreText)
              .font(.system(size: 14, weight: .light))
            
            Text(detailText)
              .font(.system(size: 14, weight: .light))
            
            ExpandableText(text: movie.overview)
              .font(.system(size: 14, weight: .regular))
              .lineLimit(3)
              .expandButton(TextSet(text: "more", font: .body, color: .blue))
              .collapseButton(TextSet(text: "less", font: .body, color: .blue))
          }
          
          HStack {
            Text("Cast")
              .font(.system(size: 24, weight: .semibold))
            Spacer()
          }
          .padding(.top, 5)
          
          CreditsListView(movieID: movie.id)
        }
        .padding(EdgeInsets(top: 5, leading: 20, bottom: 20, trailing: 20))
      }
    }
    .onAppear {
      getGenre()
      getDetailInfo()
    }
  }
  
  func getGenre() {
    genreList = GenreInfo.shared.idToName(idArray: movie.genreIDS)
    for genre in genreList {
      genreText += genre + " · "
    }
    genreText = String(genreText.dropLast(3))
  }
  
  func getDetailInfo() {
    Task {
      print(movie.id)
      do {
        if let info = try await MovieClient().getDetailInfo(movieID: movie.id) {
          movieInfo = info
          print(movieInfo)
          if let movieInfo {
            detailText = "\(movieInfo.runtime)min · \(movieInfo.releaseDate)"
          }
        }
      } catch {
        print(error)
      } 
    }
  }
}
