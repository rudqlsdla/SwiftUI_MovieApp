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
    var genreIDList: [Int] = genreList?.genres.map { $0.id } ?? []
    var genreNameList: [String] = genreList?.genres.map { $0.name } ?? []
    var resultArray: [String] = []
    print(genreIDList)
    print(genreNameList)
    for id in idArray {
      var cnt = 0
      for genreID in genreIDList {
        if id == genreID {
          resultArray.append(genreNameList[cnt])
        }
        cnt += 1
      }
    }
    return resultArray
  }
}
