//
//  CastListView.swift
//  iOSMovie
//
//  Created by 임경빈 on 2/18/24.
//

import Kingfisher
import SwiftUI

struct CreditsListView: View {
  @State private var castList: [Cast] = []
  let castWidth = 100.0
  
  let movieID: Int
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      LazyHStack(alignment: .top) {
        ForEach(castList, id: \.id) { cast in
          VStack {
            KFImage(URL(string: "https://image.tmdb.org/t/p/w185/\(cast.profilePath)"))
              .placeholder {
                Image(systemName: "person.circle")
                  .resizable()
                  .frame(width: 100, height: 100)
                  .foregroundStyle(.gray)
              }
              .resizable()
              .frame(width: castWidth, height: 100)
              .clipShape(.circle)
            Text(cast.name)
              .font(.system(size: 14, weight: .regular))
              .frame(width: castWidth)
              .lineLimit(2)
              .multilineTextAlignment(.center)
            Text(cast.character)
              .font(.system(size: 12, weight: .light))
              .frame(width: castWidth)
              .lineLimit(2)
              .multilineTextAlignment(.center)
          }
        }
      }
      .frame(height: 170)
    }
    .task {
      do {
        if let result = try await MovieClient().getCredits(movieID: movieID) {
          castList = result.cast
        }
      } catch {
        print(error)
      }
    }
  }
}
