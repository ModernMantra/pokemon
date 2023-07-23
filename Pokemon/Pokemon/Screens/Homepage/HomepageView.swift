//
//  ContentView.swift
//  Pokemon
//
//  Created by Kerim Njuhovic on 23. 7. 2023..
//

import SwiftUI

struct HomepageView: View {
    
    @StateObject var viewModel = HomepageViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.pokemons, id: \.name) { item in
                    NavigationLink(destination: EmptyView()){
                        MaterialCardView()
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}
