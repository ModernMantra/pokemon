//
//  HomepageViewModel.swift
//  Pokemon
//
//  Created by Kerim Njuhovic on 23. 7. 2023..
//

import Foundation
import Combine

class HomepageViewModel: ObservableObject {
    
    @Published var pokemons = [Pokemon]()
    
    private let networkService = NetworkService()
    private var cancellables: Set<AnyCancellable> = []
    
    init() { }
    
    func fetchData() async {
        await networkService.getRequest(PokemonRequest.allItems.request, responseType: PokemonResults.self)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching data: \(error)")
                }
            }, receiveValue: { [weak self] responseData in
                self?.pokemons = responseData.results
            })
            .store(in: &cancellables)
    }
    
}
