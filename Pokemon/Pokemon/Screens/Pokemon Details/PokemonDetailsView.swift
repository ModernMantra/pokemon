//
//  PokemonDetailsView.swift
//  Pokemon
//
//  Created by Kerim Njuhovic on 23. 7. 2023..
//

import SwiftUI

struct PokemonDetailsView: View {
    
    @StateObject private var viewModel = PokemonDetailsViewModel()
    
    @State var selectedPokemon: Pokemon
    
    var body: some View {
        ScrollView {
            VStack {
                getDetailsView(viewModel.pokemonDetails)
            }
        }
        .onAppear{
            Task {
                await viewModel.getDetailsFor(selectedPokemon: selectedPokemon)
            }
        }
        .observeError($viewModel.error) {
            Task {
                await viewModel.getDetailsFor(selectedPokemon: selectedPokemon)
            }
        }
    }
    
}

// MARK: - Subviews -

extension PokemonDetailsView {
    
    @ViewBuilder
    func getDetailsView(_ pokemonDetails: PokemonDetails?) -> some View {
        if let details = viewModel.pokemonDetails {
            VStack {
                TitleText(text: details.name.capitalized)
                    .padding(.bottom)
                
                Spacer()
                
                SubtitleView(
                    titleText: PokemonDetailsViewModel.PropertyDetails.height.title,
                    subtitleText: "\(details.height)"
                )
                    .padding()
                
                SubtitleView(
                    titleText: PokemonDetailsViewModel.PropertyDetails.weight.title,
                    subtitleText: "\(details.weight)"
                )
                    .padding()
                
                SubtitleView(
                    titleText: PokemonDetailsViewModel.PropertyDetails.baseExperience.title,
                    subtitleText: "\(details.baseExperience)"
                )
                    .padding()
                
                SubtitleView(
                    titleText: PokemonDetailsViewModel.PropertyDetails.move.title,
                    subtitleText: "\(details.moves.first?.move.name ?? "N/A")"
                )
                    .padding()
            }
            .padding()
        } else {
            EmptyView()
        }
    }
    
}
