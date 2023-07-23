//
//  Pokemon+Codable.swift
//  Pokemon
//
//  Created by Kerim Njuhovic on 23. 7. 2023..
//

import Foundation

struct PokemonResults: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [Pokemon]
}

// MARK: - Result

struct Pokemon: Codable {
    
    let name: String
    let url: String
}

extension Pokemon: Identifiable {
    var id: String {
        UUID().uuidString
    }
}

