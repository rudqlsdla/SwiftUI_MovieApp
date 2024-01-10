//
//  Movie.swift
//  iOSMovie
//
//  Created by 임경빈 on 12/7/23.
//

import Foundation

public struct Movie {
  public let page: Int
  public let results: [Datum]
  public let totalPages: Int
  public let totalResults: Int
}

public struct Datum: Codable, Identifiable {
  public let adult: Bool
  public let backdropPath: String
  public let genreIDS: [Int]
  public let id: Int
  public let originalLanguage: String
  public let originalTitle: String
  public let overview: String
  public let popularity: Double
  public let posterPath: String
  public let releaseDate: String
  public let title: String
  public let video: Bool
  public let voteAverage: Double
  public let voteCount: Int
}
