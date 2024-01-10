//
//  SearchListView.swift
//  iOSMovie
//
//  Created by 임경빈 on 1/3/24.
//

import SwiftUI

struct SearchListView: View {
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
          }
        }
      }
    }
  }
}

//#Preview {
//  SearchListView()
//}
