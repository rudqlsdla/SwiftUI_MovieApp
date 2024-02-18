//
//  DetailHeaderView.swift
//  iOSMovie
//
//  Created by 임경빈 on 2/18/24.
//

import SwiftUI

struct DetailHeaderView: View {
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
        //share
      } label: {
        Image(systemName: "square.and.arrow.up")
      }
    }
    .padding()
  }
}
