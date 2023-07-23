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
                self?.pokemons = responseData.results.sorted(by: { $0.name < $1.name })
            })
            .store(in: &cancellables)
    }
    
    func getDetailsFor(item id: Int) async {
        await networkService.getRequest(PokemonRequest.details(forItem: id).request, responseType: PokemonDetails.self)
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
                print(responseData)
            })
            .store(in: &cancellables)
    }
    
}
