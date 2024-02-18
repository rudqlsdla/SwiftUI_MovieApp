//
//  GenreModel.swift
//  iOSMovie
//
//  Created by 임경빈 on 1/30/24.
//

import Foundation

struct GenreListModel: Codable {
  let genres: [GenreModel]?
  
  func toEntity() -> GenreList {
    return GenreList(genres: genres?.map { $0.toEntity() } ?? [])
  }
}

struct GenreModel: Codable {
  let id: Int?
  let name: String?
  
  func toEntity() -> Genre {
    return Genre(
      id: id ?? -999,
      name: name ?? ""
    )
  }
}
