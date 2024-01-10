//
//  HomeView.swift
//  iOSMovie
//
//  Created by 임경빈 on 1/3/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
      ZStack {
        Color.blue.opacity(0.3)
          .ignoresSafeArea(.all)
        Text("Home")
      }
    }
}

#Preview {
    HomeView()
}
