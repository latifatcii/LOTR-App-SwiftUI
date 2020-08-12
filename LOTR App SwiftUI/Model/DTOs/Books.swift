//
//  Books.swift
//  LOTR App SwiftUI
//
//  Created by Latif Atci on 8/12/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation

struct Books: Decodable, Identifiable {
    let id, name: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
    }
}
