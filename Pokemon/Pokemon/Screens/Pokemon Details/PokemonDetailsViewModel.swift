//
//  PokemonDetailsViewModel.swift
//  Pokemon
//
//  Created by Kerim Njuhovic on 23. 7. 2023..
//

import SwiftUI
import Combine

class PokemonDetailsViewModel: ObservableObject {
    
    @Published var pokemonDetails: PokemonDetails?
    @Published var error: Error?
    
    private let networkService = NetworkService()
    private var cancellables: Set<AnyCancellable> = []
    
    init() { }
    
    func getDetailsFor(selectedPokemon pokemon: Pokemon) async {
        // Extract id from url.
        guard let pokemonId = pokemon.url.components(separatedBy: "/").filter({ $0.isEmpty == false }).last else {
            return
        }
        
        await networkService.getRequest(PokemonRequest.details(forItem: pokemonId).request, responseType: PokemonDetails.self)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.error = error
                }
            }, receiveValue: { [weak self] responseData in
                guard responseData.id > 0 else {
                    return
                }
                
                self?.error = nil
                self?.pokemonDetails = responseData
            })
            .store(in: &cancellables)
    }
    
}

// MARK: - Details Properties -

extension PokemonDetailsViewModel {
    
    enum PropertyDetails: String {
        
        case height
        case weight
        case baseExperience
        case move
        
        var title: String {
            switch self {
            case .baseExperience:
                return "Base Experience"
                
            default:
                return rawValue.capitalized
            }
        }
        
    }
    
}
