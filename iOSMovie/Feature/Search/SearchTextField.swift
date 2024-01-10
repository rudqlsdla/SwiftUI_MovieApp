//
//  SearchTextField.swift
//  iOSMovie
//
//  Created by 임경빈 on 1/3/24.
//

import SwiftUI

struct SearchTextField: View {
  @Binding var searchText: String
  @Binding var movieList: [Datum]
  @Binding var isEmpty: Bool
  
  var body: some View {
    HStack {
      Image(systemName: "magnifyingglass")
      TextField("영화를 검색해주세요.", text: $searchText, onCommit: {
        print(searchText)
        Task {
          await getSearchMovie()
        }
      })
      Button(action: {
        searchText = ""
        movieList = []
      }, label: {
        Image(systemName: "xmark.circle")
          .font(.system(size: 20))
          .foregroundStyle(.gray)
      })
      .opacity(searchText.isEmpty ? 0 : 1)
      .animation(.easeInOut, value: searchText.isEmpty)
    }
    .padding()
    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 2))
    
  }
  
  private func getSearchMovie() async {
    movieList = try! await MovieClient().getSearchData(searchText: searchText)
    if movieList.isEmpty {
      isEmpty = true
    } else {
      isEmpty = false
    }
    print(movieList)
  }
}

//#Preview {
//  SearchTextField()
//}
