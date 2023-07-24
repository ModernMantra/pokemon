//
//  ContentView.swift
//  Pokemon
//
//  Created by Kerim Njuhovic on 23. 7. 2023..
//

import SwiftUI

struct HomepageView: View {
    
    @StateObject var viewModel = HomepageViewModel()
    
    @State private(set) var isPresented: Bool = false
    @State private(set) var selected: Pokemon?
    
    var body: some View {
        NavigationView {
            itemsListView
                .navigationTitle("Pokemons")
        }
        .onAppear{
            Task {
                await viewModel.fetchData()
            }
        }
        .observeError($viewModel.error) {
            Task {
                await viewModel.fetchData()
            }
        }
    }
}

// MARK: - Subviews -

fileprivate extension HomepageView {
    
    @ViewBuilder
    var itemsListView: some View {
        ScrollView {
            ForEach(viewModel.pokemons, id: \.name) { item in
                MaterialCardView(title: item.name.capitalized, subtitle: item.url)
                    .onTapGesture {
                        selected = item
                        isPresented.toggle()
                    }
            }
            .sheet(isPresented: Binding(
                get: { isPresented },
                set: { isPresented = $0 }
            )) {
                if let selected = selected {
                    PokemonDetailsView(selectedPokemon: selected)
                }
            }
        }
    }
    
}

// MARK: - Preview -

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomepageView()
    }
    
}
