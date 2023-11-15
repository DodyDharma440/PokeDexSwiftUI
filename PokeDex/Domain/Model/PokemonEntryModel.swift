//
//  PokemonEntryModel.swift
//  PokeDex
//
//  Created by Dodi Aditya on 15/11/23.
//

import Foundation

struct PokemonEntryModel: Codable, Identifiable {
    var id = UUID()
    let name: String
    let url: String
    
    var imageUrl: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(url.split(separator: "/").last ?? "1").png"
    }
}

struct PokemonEntryResponse: Decodable {
    let name: String?
    let url: String?
}

struct PokemonResponse: Decodable {
    let count: Int?
    let results: [PokemonEntryResponse]?
}
