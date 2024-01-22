//
//  SearchMovieView.swift
//  iOSMovie
//
//  Created by 임경빈 on 12/30/23.
//

import Kingfisher
import SwiftUI

struct SearchMovieView: View {
  let movie: Datum
  var vote: Double {
    return round(movie.voteAverage / 2 * 10) / 10
  }
  
    var body: some View {
      HStack(spacing: 15) {
        KFImage(URL(string: "https://image.tmdb.org/t/p/w500/\(movie.posterPath)"))
          .placeholder {
            Image(systemName: "movieclapper")
          }
          .fade(duration: 1)
          .resizable()
          .frame(width: 90, height: 120)
        
        VStack(alignment: .leading, spacing: 10) {
          Text(movie.title)
            .font(.headline)
            .frame(minHeight: 30, maxHeight: 50)

          StarsView(vote: vote)
          
          Text("개봉 \(movie.releaseDate)")
            .font(.caption2)
          
          Spacer()
        }
        Spacer()
      }
      .padding(.vertical)
      .padding(.horizontal, 25)
      .background(Color.grayF0F0F0)
      .clipShape(.rect(cornerRadius: 10))
    }
}

extension SearchMovieView {
  struct StarsView: View {
    let vote: Double
    @State private var starCnt = 0
    
    var body: some View {
      HStack {
        ForEach(0..<Int(trunc(vote)), id: \.self) { _ in
          Image(systemName: "star.fill")
            .foregroundStyle(Color.yellow)
            .onAppear { 
              starCnt += 1
            }
        }
        if starCnt != 5 {
          if Int(vote * 10) % 10 >= 5 {
            Image(systemName: "star.leadinghalf.filled")
              .foregroundStyle(Color.yellow)
              .onAppear {
                starCnt += 1
              }
          }
          if(starCnt < 5) {
            ForEach(starCnt..<5, id: \.self) { index in
              Image(systemName: "star")
                .foregroundStyle(Color.yellow)
            }
          }
        }
        Text(String(vote))
      }
    }
  }
}

//#Preview {
//  SearchMovieView(movie: ResultModel().toEntity())
//}
