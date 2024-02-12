//
//  MovieInfo.swift
//  iOSMovie
//
//  Created by 임경빈 on 2/13/24.
//

import Foundation

struct MovieInfo {
  let adult: Bool
  let backdropPath: String
  let belongsToCollection: BelongsToCollection?
  let budget: Int
  let genres: [GenreModel]
  let homepage: String
  let id: Int
  let imdbID: String
  let originalLanguage: String
  let originalTitle: String
  let overview: String
  let popularity: Double
  let posterPath: String
  let productionCompanies: [ProductionCompanies]
  let productionCountries: [ProductionCountries]
  let releaseDate: String
  let revenue: Double
  let runtime: Int
  let spokenLanguages: [SpokenLanguages]
  let status: String
  let tagline: String
  let title: String
  let video: Bool
  let voteAverage: Double
  let voteCount: Int
}
