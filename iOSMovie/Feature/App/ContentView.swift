//
//  ContentView.swift
//  iOSMovie
//
//  Created by 임경빈 on 12/5/23.
//

import SwiftUI

struct ContentView: View {
  @State private var currentTab: Int = 1
  
  var body: some View {
    ZStack(alignment: .bottom) {
      VStack {
        TabView(selection: $currentTab) {
          ReviewView()
            .tag(0)
          HomeView()
            .tag(1)
          SearchView()
            .tag(2)
        }
//        .tabViewStyle(.page(indexDisplayMode: .never))
        //      .ignoresSafeArea(.all)
        
        TabBarView(currentTab: $currentTab)
      }
    }
  }
}

struct TabBarView: View {
  @Binding var currentTab: Int
  @Namespace var namespace
  
  var tabBarOptions: [String] = ["Review", "Home", "Search"]
  var tabBarImageOptions: [String] = ["star.square.on.square", "house", "magnifyingglass"]
  
  var body: some View {
    HStack(spacing: 20) {
      ForEach(Array(zip(tabBarOptions.indices, tabBarOptions)), id: \.0) { index, name in
        TabBarItem(currentTab: $currentTab, namespace: namespace.self, tabBarItemName: name, tabBarItemImageName: tabBarImageOptions[index], tab: index)
      }
    }
    .padding(.horizontal)
    .background(Color.white)
    .frame(height: 60)
    .ignoresSafeArea(.all)
  }
}

struct TabBarItem: View {
  @Binding var currentTab: Int
  let namespace: Namespace.ID
  
  var tabBarItemName: String
  var tabBarItemImageName: String
  var tab: Int
  
  var body: some View {
    Button {
      currentTab = tab
    } label: {
      VStack {
        if currentTab == tab {
          Color.blue
            .frame(height: 2)
            .matchedGeometryEffect(id: "underline", in: namespace, properties: .frame)
        } else {
          Color.clear.frame(height: 2)
        }
        
        Image(systemName: tabBarItemImageName)
          .padding(.top, 2)
          .font(.system(size: 18))
          .foregroundStyle(currentTab == tab ? Color.blue : Color.gray)
        
        Text(tabBarItemName)
          .font(.system(size: 14))
          .foregroundStyle(currentTab == tab ? Color.blue : Color.gray)
        
        Spacer()
      }
      .animation(.spring, value: currentTab)
    }
    .buttonStyle(.plain)
  }
}

//#Preview {
//  ContentView(movieList: [Result(adult: nil, backdropPath: nil, genreIDS: nil, id: nil, originalLanguage: nil, originalTitle: nil, overview: nil, popularity: nil, posterPath: nil, releaseDate: nil, title: nil, video: nil, voteAverage: nil, voteCount: nil)])
//}
