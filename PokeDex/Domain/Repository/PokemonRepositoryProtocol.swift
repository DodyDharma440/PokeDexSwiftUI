//
//  PokemonRepositoryProtocol.swift
//  PokeDex
//
//  Created by Dodi Aditya on 15/11/23.
//

import Foundation

protocol PokemonRepositoryProtocol {
    func getPokemons(offset: Int, limit: Int) async throws -> [PokemonEntryModel]
}

struct PokemonRepositoryImpl {
    typealias PokemonInstance = (RemoteDataSource) -> PokemonRepositoryImpl
    
    fileprivate let remote: RemoteDataSource
    
    private init(remote: RemoteDataSource) {
        self.remote = remote
    }
    
    static let sharedInstance: PokemonInstance = { remoteRepo in
        return PokemonRepositoryImpl(remote: remoteRepo)
    }
}

extension PokemonRepositoryImpl: PokemonRepositoryProtocol {
    func getPokemons(offset: Int, limit: Int) async throws -> [PokemonEntryModel] {
        do {
            let response = try await remote.getPokemons(offset: offset, limit: limit)
            return PokemonMapper.mapPokemonsResponseToDomain(input: response.results ?? [])
        } catch {
            throw error
        }
    }
}

enum PokemonMapper {
    static func mapPokemonsResponseToDomain(input results: [PokemonEntryResponse]) -> [PokemonEntryModel] {
        return results.map { res in
            return PokemonEntryModel(name: res.name ?? "Unknown", url: res.url ?? "")
        }
    }
}
