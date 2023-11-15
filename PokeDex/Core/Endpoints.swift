//
//  Endpoints.swift
//  PokeDex
//
//  Created by Dodi Aditya on 15/11/23.
//

import Foundation

struct Endpoint {
    let string: String
    
    var url: URL? {
        URL(string: string)
    }
}

enum Endpoints {
    static let baseURL = "https://pokeapi.co/api/v2"
}

extension Endpoints {
    enum Gets {
        func pokemons(offset: Int, limit: Int) -> Endpoint {
            Endpoint(string: "\(Endpoints.baseURL)/pokemon?offset=\(offset)&limit=\(limit)")
        }
    }
}
