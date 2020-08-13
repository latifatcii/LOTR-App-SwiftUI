//
//  Movie.swift
//  LOTR App
//
//  Created by Latif Atci on 7/6/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation

struct Movie: Decodable, Identifiable {
    
    let id, name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
    }
}
