//
//  MovieClient.swift
//  iOSMovie
//
//  Created by 임경빈 on 1/9/24.
//

import Foundation

public class MovieClient {
  private let apiKey = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYWM0MmYyNWYxM2UwYzU4ZjhiNDNmZDAyMjBhZGZhOCIsInN1YiI6IjY1NmFiYWMxODg2MzQ4MDBhZGUyZTM2OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ApXGO8__3s4MpeYuV29nO1Ti2-goSkzvpwZGN7jFNgo"
  
  // 검색 영화 받아오기
  func getSearchData(searchText: String) async throws -> [Movie] {
    let headers = [
      "accept": "application/json",
      "Authorization": apiKey
    ]
    
    let url = URL(string: "https://api.themoviedb.org/3/search/movie?query=\(searchText)&include_adult=false&language=en-US&page=1")!
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    
    do {
      let (data, _) = try await URLSession.shared.data(for: request)
      let movieModel = try JSONDecoder().decode(MovieListModel.self, from: data)
      return movieModel.toEntity().results
    } catch {
      throw error
    }
  }
  
  // 인기 있는 영화 받아오기
  func getTopRatedMovie() async throws -> [Movie] {
    let urlString = "https://api.themoviedb.org/3/movie/popular"
    var urlBuilder = URLComponents(string: urlString)
    urlBuilder?.queryItems = [
      URLQueryItem(name: "language", value: "en-US")
    ]
    guard let url = urlBuilder?.url else { return [] }
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue(apiKey, forHTTPHeaderField: "Authorization")
    request.setValue("application/json", forHTTPHeaderField: "accept")
    
    do {
      let (data, _) = try await URLSession.shared.data(for: request)
      let movieModel = try JSONDecoder().decode(MovieListModel.self, from: data)
      return movieModel.toEntity().results
    } catch {
      throw error
    }
  }
  
  func getDetailInfo(movieID: Int) async throws -> MovieInfo? {
    let urlString = "https://api.themoviedb.org/3/movie/\(movieID)"
    guard let url = URL(string: urlString) else { return nil  }
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue(apiKey, forHTTPHeaderField: "Authorization")
    request.setValue("application/json", forHTTPHeaderField: "accept")
    
    do {
      let (data, _) = try await URLSession.shared.data(for: request)
      print(data)
      let infoModel = try JSONDecoder().decode(MovieInfoModel.self, from: data)
      print(infoModel)
      return infoModel.toEntitiy()
    } catch {
      throw error
    }
  }
  
  // 장르 받아오기
  func getGenres() async throws -> GenreList? {
    let urlString = "https://api.themoviedb.org/3/genre/movie/list"
    var urlBuilder = URLComponents(string: urlString)
    urlBuilder?.queryItems = [
      URLQueryItem(name: "language", value: "en-US")
    ]
    guard let url = urlBuilder?.url else { return nil }
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue(apiKey, forHTTPHeaderField: "Authorization")
    request.setValue("application/json", forHTTPHeaderField: "accept")
    
    do {
      let (data, _) = try await URLSession.shared.data(for: request)
      let genreListModel = try JSONDecoder().decode(GenreListModel.self, from: data)
      return genreListModel.toEntity()
    } catch {
      throw error
    }
  }
  
  // credits 받아오기
  func getCredits(movieID: Int) async throws -> Credits? {
    let urlString = "https://api.themoviedb.org/3/movie/\(movieID)/credits"
    guard let url = URL(string: urlString) else { return nil  }
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue(apiKey, forHTTPHeaderField: "Authorization")
    request.setValue("application/json", forHTTPHeaderField: "accept")
    
    do {
      let (data, _) = try await URLSession.shared.data(for: request)
      print(data)
      let creditsModel = try JSONDecoder().decode(CreditsModel.self, from: data)
      print(creditsModel)
      return creditsModel.toEntity()
    } catch {
      throw error
    }
  }
}
