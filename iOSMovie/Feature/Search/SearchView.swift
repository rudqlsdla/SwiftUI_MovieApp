//
//  SearchView.swift
//  iOSMovie
//
//  Created by 임경빈 on 12/7/23.
//

import SwiftUI

struct SearchView: View {
  @State private var searchText: String = ""
  @State private var movieList: [Datum] = []
  @State private var isEmpty = false
  
  var body: some View {
    VStack(spacing: 10){
      SearchTextField(searchText: $searchText, movieList: $movieList, isEmpty: $isEmpty)
      SearchListView(movieList: $movieList, isEmpty: $isEmpty)
    }
    .padding()
  }
}
