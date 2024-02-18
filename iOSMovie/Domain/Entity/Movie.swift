//
//  Movie.swift
//  iOSMovie
//
//  Created by 임경빈 on 12/7/23.
//

import Foundation

public struct MovieList {
  public let page: Int
  public let results: [Movie]
  public let totalPages: Int
  public let totalResults: Int
}

public struct Movie: Codable, Identifiable, Equatable {
  public var index: Int
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
