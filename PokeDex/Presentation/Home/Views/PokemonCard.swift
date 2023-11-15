//
//  PokemonCard.swift
//  PokeDex
//
//  Created by Dodi Aditya on 15/11/23.
//

import SwiftUI

struct PokemonCard: View {
    var pokemon: PokemonEntryModel
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: pokemon.imageUrl)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Rectangle()
                    .fill(.ultraThinMaterial)
            }
            .frame(width: 120, height: 120)
            
            Text(pokemon.name)
                .font(.headline)
                .fontWeight(.semibold)
        } // VStack
        .frame(maxWidth: .infinity)
        .padding()
        .background(.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    PokemonCard(pokemon: PokemonEntryModel(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"))
}
