//
//  PokemonRequest.swift
//  Pokemon
//
//  Created by Kerim Njuhovic on 23. 7. 2023..
//

import Foundation

enum PokemonRequest: RequestBuilder {
    
    case allItems
    case details(forItem: Int)
    
    var path: String {
        switch self {
        case .allItems:
            return "/pokemon"
            
        case .details(let item):
            return "/pokemon/\(item)"
        }
    }
    
    var request: URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        return request
    }
    
}
