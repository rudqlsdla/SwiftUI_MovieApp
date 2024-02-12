//
//  MovieInfo.swift
//  iOSMovie
//
//  Created by 임경빈 on 2/12/24.
//

// MARK: - Welcome
struct MovieInfoModel: Codable {
  let adult: Bool?
  let backdropPath: String?
  let belongsToCollection: BelongsToCollection?
  let budget: Int?
  let genres: [GenreModel]?
  let homepage: String?
  let id: Int?
  let imdbID: String?
  let originalLanguage: String?
  let originalTitle: String?
  let overview: String?
  let popularity: Double?
  let posterPath: String?
  let productionCompanies: [ProductionCompanies]?
  let productionCountries: [ProductionCountries]?
  let releaseDate: String?
  let revenue: Double?
  let runtime: Int?
  let spokenLanguages: [SpokenLanguages]?
  let status: String?
  let tagline: String?
  let title: String?
  let video: Bool?
  let voteAverage: Double?
  let voteCount: Int?
  
  enum CodingKeys: String, CodingKey {
    case adult
    case backdropPath = "backdrop_path"
    case belongsToCollection = "belongs_to_collection"
    case budget
    case genres
    case homepage
    case id
    case imdbID = "imdb_id"
    case originalLanguage = "original_language"
    case originalTitle = "original_title"
    case overview
    case popularity
    case posterPath = "poster_path"
    case productionCompanies = "production_companies"
    case productionCountries = "production_countries"
    case releaseDate = "release_date"
    case revenue
    case runtime
    case spokenLanguages = "spoken_languages"
    case status
    case tagline
    case title
    case video
    case voteAverage = "vote_average"
    case voteCount = "vote_count"
  }
  
  func toEntitiy() -> MovieInfo {
    return MovieInfo(
      adult: adult ?? false,
      backdropPath: backdropPath ?? "",
      belongsToCollection: belongsToCollection,
      budget: budget ?? 0,
      genres: genres ?? [],
      homepage: homepage ?? "",
      id: id ?? -999,
      imdbID: imdbID ?? "",
      originalLanguage: originalLanguage ?? "",
      originalTitle: originalTitle ?? "",
      overview: overview ?? "",
      popularity: popularity ?? 0,
      posterPath: posterPath ?? "",
      productionCompanies: productionCompanies ?? [],
      productionCountries: productionCountries ?? [],
      releaseDate: releaseDate ?? "",
      revenue: revenue ?? 0,
      runtime: runtime ?? 0,
      spokenLanguages: spokenLanguages ?? [],
      status: status ?? "",
      tagline: tagline ?? "",
      title: title ?? "",
      video: video ?? false,
      voteAverage: voteAverage ?? 0,
      voteCount: voteCount ?? 0
    )
  }
}

// MARK: - BelongsToCollection
struct BelongsToCollection: Codable {
  let id: Int?
  let name: String?
  let posterPath: String?
  let backdropPath: String?
  
  enum Codingkeys: String, CodingKey {
    case id, name
    case posterPath = "poster_path"
    case backdropPath = "backdrop_path"
  }
}

struct ProductionCompanies: Codable {
  let id: Int?
  let logoPath: String?
  let name: String?
  let originCountry: String?
  
  enum CodingKeys: String, CodingKey {
    case id, name
    case logoPath = "logo_path"
    case originCountry = "origin_country"
  }
}

struct ProductionCountries: Codable {
  let iso_3166_1: String?
  let name: String?
}

struct SpokenLanguages: Codable {
  let englishName: String?
  let iso_639_1: String?
  let name: String?
  
  enum CodingKeys: String, CodingKey {
    case englishName = "english_name"
    case iso_639_1
    case name
  }
}
