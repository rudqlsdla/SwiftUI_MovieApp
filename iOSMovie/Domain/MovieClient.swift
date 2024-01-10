//
//  MovieClient.swift
//  iOSMovie
//
//  Created by 임경빈 on 1/9/24.
//

import Foundation

public class MovieClient {
  func getSearchData(searchText: String) async throws -> [Datum] {
    let headers = [
      "accept": "application/json",
      "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYWM0MmYyNWYxM2UwYzU4ZjhiNDNmZDAyMjBhZGZhOCIsInN1YiI6IjY1NmFiYWMxODg2MzQ4MDBhZGUyZTM2OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ApXGO8__3s4MpeYuV29nO1Ti2-goSkzvpwZGN7jFNgo"
    ]
    
    let url = URL(string: "https://api.themoviedb.org/3/search/movie?query=\(searchText)&include_adult=false&language=ko-KR&page=1")!
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    
    do {
      let (data, _) = try await URLSession.shared.data(for: request)
      let movieModel = try JSONDecoder().decode(MovieModel.self, from: data)
      return movieModel.toEntity().results
    } catch {
      throw error
    }
  }
  
  func getTopRatedMovie() async throws -> [Datum] {
    let urlString = "https://api.themoviedb.org/3/movie/top_rated"
    var urlBuilder = URLComponents(string: urlString)
    urlBuilder?.queryItems = [
      URLQueryItem(name: "language", value: "ko-KR")
    ]
    guard let url = urlBuilder?.url else { return [] }
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    let apiKey = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYWM0MmYyNWYxM2UwYzU4ZjhiNDNmZDAyMjBhZGZhOCIsInN1YiI6IjY1NmFiYWMxODg2MzQ4MDBhZGUyZTM2OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ApXGO8__3s4MpeYuV29nO1Ti2-goSkzvpwZGN7jFNgo"
    request.setValue(apiKey, forHTTPHeaderField: "Authorization")
    request.setValue("application/json", forHTTPHeaderField: "accept")
    
    do {
      let (data, _) = try await URLSession.shared.data(for: request)
      let movieModel = try JSONDecoder().decode(MovieModel.self, from: data)
      return movieModel.toEntity().results
    } catch {
      throw error
    }
  }
}
