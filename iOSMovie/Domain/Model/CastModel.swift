//
//  CastModel.swift
//  iOSMovie
//
//  Created by 임경빈 on 2/18/24.
//

import SwiftUI

struct CastModel: Codable {
  let adult: Bool?
  let gender: Int?
  let id: Int?
  let knownForDepartment: String? //known_for_department
  let name: String?
  let originalName: String? //original_name
  let popularity: Double?
  let profilePath: String? //profile_path
  let castID: Int? //cast_id
  let character: String?
  let creditID: String? // credit_id
  let order: Int?
  
  enum CodingKeys: String, CodingKey {
    case adult
    case gender
    case id
    case knownForDepartment = "known_for_department"
    case name
    case originalName = "original_name"
    case popularity
    case profilePath = "profile_path"
    case castID = "cast_id"
    case character
    case creditID = "credit_id"
    case order
  }
  
  func toEntity() -> Cast {
    return Cast(
      adult: adult ?? false,
      gender: gender ?? 0,
      id: id ?? -999,
      knownForDepartment: knownForDepartment ?? "",
      name: name ?? "",
      originalName: originalName ?? "",
      popularity: popularity ?? 0,
      profilePath: profilePath ?? "",
      castID: castID ?? -999,
      character: character ?? "",
      creditID: creditID ?? "",
      order: order ?? 0
    )
  }
}
