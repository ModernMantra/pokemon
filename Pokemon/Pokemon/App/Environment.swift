//
//  Environment.swift
//  Pokemon
//
//  Created by Kerim Njuhovic on 23. 7. 2023..
//

import Foundation

enum Environment {
    
    case development
    
    var url: URL {
        switch self {
        case .development:
            return URL(string: "https://pokeapi.co/api/v2")!
        }
    }
    
}
