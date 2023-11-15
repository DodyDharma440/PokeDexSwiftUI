//
//  RemoteDataSource.swift
//  PokeDex
//
//  Created by Dodi Aditya on 15/11/23.
//

import Foundation

protocol RemoteDataSourceProtocol {
    func getPokemons(offset: Int, limit: Int) async throws -> PokemonResponse
}

class RemoteDataSource {
    static let shared = RemoteDataSource()
}

extension RemoteDataSource: RemoteDataSourceProtocol {
    func getPokemons(offset: Int, limit: Int) async throws -> PokemonResponse {
        guard let url = Endpoints.Gets.pokemons(offset: offset, limit: limit).url else { throw URLError(.badURL) }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        do {
            let decoded = try JSONDecoder().decode(PokemonResponse.self, from: data)
            return decoded
        } catch {
            throw URLError(.cannotParseResponse)
        }
    }
}
