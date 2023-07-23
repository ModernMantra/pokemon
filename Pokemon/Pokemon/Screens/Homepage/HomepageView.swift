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
    @State private var selected: Pokemon?
    
    var body: some View {
        NavigationView {
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
                        ActionSheet(pokemon: selected)
                    }
                }
            }
        }
        .onAppear{
            Task {
                await viewModel.fetchData()
            }
        }
    }
}

struct ActionSheet: View {
    
    @State var pokemon: Pokemon
    
    var body: some View {
        VStack {
            Text("\(pokemon.name)")
        }
        .background(Color.blue.opacity(0.3))
        .onAppear{
            Task {
                await HomepageViewModel().getDetailsFor(item: 2)
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
