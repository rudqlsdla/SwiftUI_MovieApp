//
//  CreditsModel.swift
//  iOSMovie
//
//  Created by 임경빈 on 2/18/24.
//

import Foundation

struct CreditsModel: Codable {
  let id: Int?
  let cast: [CastModel]?
  
  func toEntity() -> Credits {
    return Credits(
      id: id ?? -999,
      cast: cast?.map { $0.toEntity() } ?? []
    )
  }
}
