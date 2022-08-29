//
//  NetworkDataFetcher.swift
//  MovieHouse
//
//  Created by Vladimir Fibe on 29.08.2022.
//

import Foundation

class NetworkDataFetcher {
  var networkService = NetworkService()
  func fetchMovie(with id: Int, completion: @escaping (Movie?) -> ()) {
    networkService.request(id: id) { data, error in
      if let error = error {
        print("Error received requesting data: \(error.localizedDescription)")
        completion(nil)
      } else {
        let decode = self.decodeJSON(type: Movie.self, from: data)
        completion(decode)
      }
    }
  }
  func fetchMovies(searchTerms: String, completion: @escaping (SearchResponse?) -> ()) {
    networkService.request(searchTerm: searchTerms) { data, error in
      if let error = error {
        print("Error received requesting data: \(error.localizedDescription)")
        completion(nil)
      } else {
        let decode = self.decodeJSON(type: SearchResponse.self, from: data)
        completion(decode)
      }
    }
  }
  
  func decodeJSON<T: Decodable>(type: T.Type, from data: Data?) -> T? {
    let decoder = JSONDecoder()
    guard let data = data else { return nil }
    do {
      let object = try decoder.decode(type.self, from: data)
      return object
    } catch {
      print("Failed to decode JSON \(error.localizedDescription)")
      return nil
    }
  }
}
