//
//  ReviewView.swift
//  iOSMovie
//
//  Created by 임경빈 on 1/3/24.
//

import Kingfisher
import RealmSwift
import SwiftUI

enum ReviewTab {
  case title
  case poster
}

struct ReviewView: View {
  @ObservedResults(ReviewSection.self) var reviews
  @State private var currentTab: ReviewTab = .title
  
  let columns = [
    GridItem(.flexible()),
    GridItem(.flexible()),
    GridItem(.flexible())
  ]
  
  var body: some View {
    VStack(spacing: 10) {
      HStack {
        Button {
          currentTab = .title
        } label: {
          Text("Title")
            .frame(width: 80, height: 40)
            .background(currentTab == .title ? .blue1112AF : .white)
            .foregroundStyle(currentTab == .title ? .white : .black)
            .clipShape(.rect(cornerRadius: 8))
        }
        
        Button {
          currentTab = .poster
        } label: {
          Text("Poster")
            .frame(width: 80, height: 40)
            .background(currentTab == .poster ? .blue1112AF : .white)
            .foregroundStyle(currentTab == .poster ? .white : .black)
            .clipShape(.rect(cornerRadius: 8))
        }
      }
      .padding(8)
      .background(.grayF0F0F0)
      .clipShape(.rect(cornerRadius: 8))
      
      if currentTab == .title {
        List {
          ForEach(reviews, id: \.id) { review in
            Text(review.title)
          }
          .listRowBackground(Color.grayF0F0F0)
        }
        .scrollContentBackground(.hidden)
      } else {
        ScrollView {
          LazyVGrid(columns: columns, spacing: 10) {
            ForEach(reviews, id: \.id) { review in
              KFImage(URL(string: "https://image.tmdb.org/t/p/w92/\(review.posterURL)"))
                .placeholder {
                  Image(systemName: "movieclapper")
                }
                .fade(duration: 1)
                .clipShape(.rect(cornerRadius: 10))
                .shadow(color: .black.opacity(0.2), radius: 8)
            }
          }
          .padding(.horizontal, 10)
        }
      }
    }
  }
}

#Preview {
  ReviewView()
}
