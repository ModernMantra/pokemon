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
    @Published var error: Error?
    
    private let networkService = NetworkService()
    private var cancellables: Set<AnyCancellable> = []
    
    init() { }
    
    func fetchData() async {
        await networkService.getRequest(PokemonRequest.allItems.request, responseType: PokemonResults.self)
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
                guard !responseData.results.isEmpty else {
                    return
                }
                
                self?.error = nil
                self?.pokemons = responseData.results.sorted(by: { $0.name < $1.name })
            })
            .store(in: &cancellables)
    }
    
}
