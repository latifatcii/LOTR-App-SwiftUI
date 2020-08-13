//
//  MoviesViewModel.swift
//  LOTR App SwiftUI
//
//  Created by Latif Atci on 8/13/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation
import Combine

final class MoviesViewModel: ObservableObject {
    
    var service: LOTRService
    
    private var subscriptions = Set<AnyCancellable>()
    @Published private(set) var movies = [Movie]()
    
    init(service: LOTRService = LOTRService()) {
        
        self.service = service
        
        service.fetchMovies()
            .sink(receiveCompletion: {
                completion in
                switch completion {
                case .failure(let error):
                    print(error.rawValue)
                case .finished:
                    print("finished")
                }
            }, receiveValue: {
                [weak self]
                moviesResponses in
                guard let self = self else { return }
                self.movies = moviesResponses.movie
            })
            .store(in: &subscriptions)
    }
}
