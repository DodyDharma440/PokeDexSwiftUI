//
//  HomeView.swift
//  PokeDex
//
//  Created by Dodi Aditya on 15/11/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeVm = HomeViewModel(getPokemonsUseCase: Injection.shared.provideGetPokemonsUseCase())
    
    let gridColumns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    
    var body: some View {
        NavigationView {
            Group {
                if homeVm.isLoading {
                    ProgressView()
                } else if let errorMessage = homeVm.errorMessage {
                    Text(errorMessage)
                } else {
                    ScrollView {
                        LazyVGrid(columns: gridColumns, spacing: 20) {
                            ForEach(homeVm.pokemons) { pokemon in
                                PokemonCard(pokemon: pokemon)
                            } // Loop
                        } // Grid
                        .padding(.horizontal, 24)
                    } // Scroll
                } // Condition
            } // Group
            .navigationTitle("PokeDex")
        } // Scroll
        .task {
            try? await homeVm.getPokemons(offset: 0, limit: 10)
        }
    }
}

#Preview {
    HomeView()
}
