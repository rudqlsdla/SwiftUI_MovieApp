//
//  DetailHeaderView.swift
//  iOSMovie
//
//  Created by 임경빈 on 2/18/24.
//

import SwiftUI

struct DetailHeaderView: View {
  @State private var isReviewPresented = false
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
        isReviewPresented = true
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
    .sheet(isPresented: $isReviewPresented, content: {
      CreateReviewView(movieTitle: movie.title, posterURL: movie.posterPath, isPresented: $isReviewPresented)
    })
    .sheet(isPresented: $isSharePresented, content: {
      ActivityViewController(activityItems: ["Title : \(movie.title)", "Overview : \(movie.overview)", "release : \(movie.releaseDate)"])
    })
  }
}
