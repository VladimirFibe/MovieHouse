//
//  NetworkService.swift
//  MovieHouse
//
//  Created by Vladimir Fibe on 29.08.2022.
// https://api.themoviedb.org/3/search/movie?api_key=d05573814638e3e0806fd4c425fe676a&query=wonder

import Foundation

class NetworkService {
  func request(id: Int, completion: @escaping (Data?, Error?) -> Void) {
    let parameters = prepareParameters()
    guard let url = url(params: parameters, path: "/3/movie/\(id)") else { return }
    print(url)
    var request = URLRequest(url: url)
    request.httpMethod = "get"
    let task = createDataTask(from: request, completion: completion)
    task.resume()
  }
  
  func request(searchTerm: String, completion: @escaping (Data?, Error?) -> Void) {
    let parameters = prepareParameters(searchTerm: searchTerm)
    guard let url = url(params: parameters, path: "/3/search/movie") else { return }
    print(url)

    var request = URLRequest(url: url)
    request.httpMethod = "get"
    let task = createDataTask(from: request, completion: completion)
    task.resume()
  }
  // https://developers.themoviedb.org/3/search/search-movies
  private func prepareParameters(searchTerm: String? = nil) -> [String: String] {
    var parameters = [String: String]()
    if let searchTerm = searchTerm {
      parameters["query"] = searchTerm
    }
    parameters["api_key"] = "d05573814638e3e0806fd4c425fe676a"
    return parameters
  }
  private func url(params: [String: String], path: String) -> URL? {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "api.themoviedb.org"
    components.path = path
    components.queryItems = params.map { URLQueryItem(name: $0.0, value: $0.1)}
    return components.url
  }
  private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
    URLSession.shared.dataTask(with: request) { data, response, error in
      DispatchQueue.main.async {
        completion(data, error)
      }
    }
  }
}

