//
//  NetworkUtility.swift
//  CricutAssessment
//
//  Created by Ruchi Agrawal on 3/10/25.
//

import Foundation
import Combine

/// Network utility to download data for a URL.
public class NetworkUtility {
  /// Returns the data for the URL. If `canReturnCachedData` is true, it will look for data in the cache before going out to the internet to get the data.
  /// - Parameters:
  ///   - url: the URL to get the data from.
  ///   - canReturnCachedData: Whether to check the cache first for data.
  ///
  /// - Returns: Either the data or an error.
  public func downloadData(
    for url: URL,
    canReturnCachedData: Bool
  ) async throws -> Data {
    let cachePolicy: URLRequest.CachePolicy = canReturnCachedData ? .useProtocolCachePolicy : .returnCacheDataElseLoad
    let urlRequest = URLRequest(url: url, cachePolicy: cachePolicy)
    
    if canReturnCachedData, let cachedData = URLCache.shared.cachedResponse(for: urlRequest)?.data {
      return cachedData
    }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    let cachedResponse = CachedURLResponse(response: response, data: data)
    URLCache.shared.storeCachedResponse(cachedResponse, for: urlRequest)
    
    return data
  }
}
