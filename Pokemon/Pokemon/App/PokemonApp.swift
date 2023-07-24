//
//  PokemonApp.swift
//  Pokemon
//
//  Created by Kerim Njuhovic on 23. 7. 2023..
//

import SwiftUI

@main
struct PokemonApp: App {

    static let environment = Environment.development

    var body: some Scene {
        WindowGroup {
            HomepageView()
        }
    }
    
}
