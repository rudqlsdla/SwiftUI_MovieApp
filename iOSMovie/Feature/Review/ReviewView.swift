//
//  ReviewView.swift
//  iOSMovie
//
//  Created by 임경빈 on 1/3/24.
//

import SwiftUI

struct ReviewView: View {
    var body: some View {
      ZStack {
        Color.yellow.opacity(0.3)
          .ignoresSafeArea(.all)
        Text("Review")
      }
    }
}

#Preview {
    ReviewView()
}
