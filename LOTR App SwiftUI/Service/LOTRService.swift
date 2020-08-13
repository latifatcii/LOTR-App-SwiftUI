//
//  LOTRService.swift
//  LOTR App SwiftUI
//
//  Created by Latif Atci on 8/13/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation
import Combine

enum RequestType: String {
    case book
    case movie
}

extension RequestType: APISetting {
    var path: String {
        switch self {
        case .book:
            return "/v1/book"
        case .movie:
            return "/v1/movie"
        }
    }
}

class LOTRService {
    
    func fetchMovies() -> AnyPublisher<MovieResponses, NetworkResponse> {
        return apiRequest(requestType: .movie)
    }
    
    func fetchBooks() -> AnyPublisher<BooksResponses, NetworkResponse> {
        return apiRequest(requestType: .book)
    }
    
    private func apiRequest<T: Decodable>(requestType: RequestType) -> AnyPublisher<T, NetworkResponse>{
         return URLSession.shared.dataTaskPublisher(for: requestType.createURLRequest()!)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { _ in NetworkResponse.noData }
            .eraseToAnyPublisher()
    }
}
