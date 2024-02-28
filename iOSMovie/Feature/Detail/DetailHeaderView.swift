//
//  DetailHeaderView.swift
//  iOSMovie
//
//  Created by 임경빈 on 2/18/24.
//

import SwiftUI

struct DetailHeaderView: View {
  @State private var isSharePresented = false
  
  let movie: Movie
  let closeAction: () -> Void
  
  var body: some View {
    HStack(spacing: 15) {
      Button {
        closeAction()
      } label: {
        Image(systemName: "xmark")
      }
      
      Spacer()
      Button {
        //review
      } label: {
        Image(systemName: "book.pages")
      }
      
      Button {
        isSharePresented = true
      } label: {
        Image(systemName: "square.and.arrow.up")
      }
    }
    .padding()
    .sheet(isPresented: $isSharePresented, content: {
      ActivityViewController(activityItems: [movie.title, movie.overview, movie.releaseDate])
    })
  }
}
