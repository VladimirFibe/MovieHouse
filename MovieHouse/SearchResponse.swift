//
//  SearchResponse.swift
//  MovieHouse
//
//  Created by Vladimir Fibe on 29.08.2022.
// https://developers.themoviedb.org/3/search/search-movies

import Foundation

struct SearchResponse: Codable {
  let page: Int?
  let totalResults: Int?
  let totalPages: Int?
  let results: [Movie]
  
  enum CodingKeys: String, CodingKey {
      case page
      case totalResults = "total_results"
      case totalPages = "total_pages"
      case results
  }
}
