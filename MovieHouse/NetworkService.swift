//
//  NetworkService.swift
//  MovieHouse
//
//  Created by Vladimir Fibe on 29.08.2022.
// https://api.themoviedb.org/3/search/movie?api_key=d05573814638e3e0806fd4c425fe676a&query=wonder

import Foundation

class NetworkService {
  func request(searchTerm: String, completion: (Data?, Error?) -> Void) {
    let parameters = prepareParameters(searchTerm: searchTerm)
    if let url = url(params: parameters) {
      print(url)
    } else {
      print("что то не так")
    }
    
  }
  // https://developers.themoviedb.org/3/search/search-movies
  private func prepareParameters(searchTerm: String) -> [String: String] {
    var parameters = [String: String]()
    parameters["query"] = searchTerm
    parameters["page"] = "1"
    return parameters
  }
  private func url(params: [String: String]) -> URL? {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "api.themoviedb.org"
    components.path = "/3/search/movie"
    components.queryItems = params.map { URLQueryItem(name: $0.0, value: $0.1)}
    return components.url
  }
}

