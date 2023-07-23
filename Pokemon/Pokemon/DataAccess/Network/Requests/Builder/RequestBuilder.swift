//
//  RequestBuilder.swift
//  Pokemon
//
//  Created by Kerim Njuhovic on 23. 7. 2023..
//

import Foundation

protocol RequestBuilder {
    
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var request: URLRequest { get }
    
}

extension RequestBuilder {
    
    var baseURL: URL {
        PokemonApp.environment.url
    }
    
    var method: HTTPMethod {
        .get
    }
    
}
