//
//  GenreInfo.swift
//  iOSMovie
//
//  Created by 임경빈 on 1/30/24.
//

import Foundation

class GenreInfo {
  static let shared = GenreInfo()
  
  var genreList: GenreList?
  
  private init() { }
  
  func idToName(idArray: [Int]) -> [String] {
    let genreArray: [(id: Int, name: String)] = genreList?.genres.map { ($0.id, $0.name) } ?? []
    let resultArray = idArray.flatMap { id in // flatMap으로 2차원 배열을 단일 배열로 치환
      genreArray.filter {
        $0.id == id // 선택한 영화의 장르 id와 기준 장르 id 비교
      }.map { $0.name } // 튜플 두 번째 받아오기 -> name
    }
    return resultArray
  }
}

// 고차함수를 통한 리팩토링
