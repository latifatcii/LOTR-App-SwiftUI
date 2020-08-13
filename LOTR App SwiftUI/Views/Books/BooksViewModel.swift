//
//  BooksViewModel.swift
//  LOTR App SwiftUI
//
//  Created by Latif Atci on 8/13/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation
import Combine


final class BooksViewModel: ObservableObject {
    var service: LOTRService
    
    
    private var subscriptions = Set<AnyCancellable>()
    @Published var loading = true
    @Published private(set) var books = [Books]()
    
    init(service: LOTRService = LOTRService()) {
        
        self.service = service
        _ = service.fetchBooks()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: {
                completion in
                switch completion {
                case .failure(let error):
                    self.loading = false
                    print(error.rawValue)
                case .finished:
                    print("finished")
                }
            }, receiveValue: { [weak self]
                bookResponses in
                guard let self = self else { return }
                self.books = bookResponses.books
            })
            
            .store(in: &subscriptions)
    }
}
