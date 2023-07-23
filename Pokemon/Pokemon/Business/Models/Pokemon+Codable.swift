//
//  Pokemon+Codable.swift
//  Pokemon
//
//  Created by Kerim Njuhovic on 23. 7. 2023..
//

import Foundation

struct Pokemon: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [Result]
}

// MARK: - Result

struct Result: Codable {
    let name: String
    let url: String
}

