//
//  BooksResponses.swift
//  LOTR App SwiftUI
//
//  Created by Latif Atci on 8/12/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation

struct BooksResponses: Decodable {
    
    private enum RootCodingKeys: String, CodingKey {
        case docs
    }
    
    let books: [Books]
    
    init(books: [Books]) {
        self.books = books
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        self.books = try rootContainer.decode([Books].self, forKey: .docs)
    }
}
