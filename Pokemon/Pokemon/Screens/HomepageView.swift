//
//  ContentView.swift
//  Pokemon
//
//  Created by Kerim Njuhovic on 23. 7. 2023..
//

import SwiftUI
import Combine

class HomepageViewModel: ObservableObject {
    
    let networkService = NetworkService()
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        
    }
    
    func fetchData() async {
        await networkService.getRequest(PokemonRequest.allItems.request, responseType: Welcome.self)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching data: \(error)")
                }
            }, receiveValue: { responseData in
                // Handle the fetched data here
                // self.data = responseData
                print(responseData)
            })
            .store(in: &cancellables)
    }
    
}

struct HomepageView: View {
    
    @StateObject var viewModel = HomepageViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onAppear{
            Task {
                await viewModel.fetchData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}
