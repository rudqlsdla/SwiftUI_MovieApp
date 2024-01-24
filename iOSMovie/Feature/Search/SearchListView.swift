//
//  SearchListView.swift
//  iOSMovie
//
//  Created by 임경빈 on 1/3/24.
//

import SwiftUI

struct SearchListView: View {
  @State private var selectedMovie: Datum?
  @Binding var movieList: [Datum]
  @Binding var isEmpty: Bool
  
  var body: some View {
    ZStack {
      if isEmpty {
        Text("검색 결과가 없습니다.")
      }
      ScrollView {
        VStack(spacing: 10) {
          ForEach(movieList) { movie in
            SearchMovieView(movie: movie)
              .onTapGesture {
                selectedMovie = movie
              }
          }
          .sheet(item: $selectedMovie) { selectedMovie in
            MovieDetailView(movie: selectedMovie)
          }
        }
      }
    }
  }
}

//#Preview {
//  SearchListView()
//}
