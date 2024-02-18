//
//  MovieModel.swift
//  iOSMovie
//
//  Created by 임경빈 on 12/30/23.
//

import Foundation

// MARK: - Movie
struct MovieListModel: Codable {
  let page: Int?
  let results: [ResultModel]?
  let totalPages, totalResults: Int?
  
  enum CodingKeys: String, CodingKey {
    case page
    case results
    case totalPages = "total_pages"
    case totalResults = "total_results"
  }
  
  func toEntity() -> MovieList {
    return MovieList(
      page: page ?? 0,
      results: results?.map { $0.toEntity() } ?? [],
      totalPages: totalPages ?? 0,
      totalResults: totalResults ?? 0
    )
  }
}

// MARK: - Result
struct ResultModel: Codable {
  let adult: Bool?
  let backdropPath: String?
  let genreIDS: [Int]?
  let id: Int?
  let originalLanguage, originalTitle, overview: String?
  let popularity: Double?
  let posterPath, releaseDate, title: String?
  let video: Bool?
  let voteAverage: Double?
  let voteCount: Int?
  
  enum CodingKeys: String, CodingKey {
    case adult
    case backdropPath = "backdrop_path"
    case genreIDS = "genre_ids"
    case id
    case originalLanguage = "original_language"
    case originalTitle = "original_title"
    case overview, popularity
    case posterPath = "poster_path"
    case releaseDate = "release_date"
    case title, video
    case voteAverage = "vote_average"
    case voteCount = "vote_count"
  }
  
  func toEntity() -> Movie {
    Movie(
      index: 0,
      adult: adult ?? false,
      backdropPath: backdropPath ?? "",
      genreIDS: genreIDS ?? [],
      id: id ?? 0,
      originalLanguage: originalLanguage ?? "",
      originalTitle: originalTitle ?? "",
      overview: overview ?? "",
      popularity: popularity ?? 0,
      posterPath: posterPath ?? "",
      releaseDate: releaseDate ?? "",
      title: title ?? "",
      video: video ?? false,
      voteAverage: voteAverage ?? 0,
      voteCount: voteCount ?? 0
    )
  }
}
