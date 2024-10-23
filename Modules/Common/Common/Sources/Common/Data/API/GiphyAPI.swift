//
//  GiphyAPI.swift
//
//
//  Created by Uwais Alqadri on 10/17/21.
//

import Foundation

public enum GiphyAPI {
  case trending
  case random
  case search(query: String)
}

extension GiphyAPI: APIFactory {
  public var baseURL: String {
    APIConfig.giphyConfig.baseUrl
  }

  public var path: String {
    switch self {
    case .random:
      return "random"
    case .trending:
      return "trending"
    case .search:
      return "search"
    }
  }

  public var parameter: [String: Any] {
    var defaultParams: [String: Any] = ["api_key": APIConfig.giphyConfig.apiKey]
    switch self {
    case .search(let query) where query.count > 0:
      defaultParams["q"] = query
    default:
      break
    }
    return defaultParams
  }
}
