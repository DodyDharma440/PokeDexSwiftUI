//
//  GetPokemons.swift
//  PokeDex
//
//  Created by Dodi Aditya on 15/11/23.
//

import Foundation

protocol GetPokemonsUseCase {
    func execute(offset: Int, limit: Int) async throws -> Result<[PokemonEntryModel], Error>
}

struct GetPokemonsUseCaseImpl: GetPokemonsUseCase {
    let repo: PokemonRepositoryProtocol
    
    func execute(offset: Int, limit: Int) async throws -> Result<[PokemonEntryModel], Error> {
        do {
            let pokemons = try await repo.getPokemons(offset: offset, limit: limit)
            return .success(pokemons)
        } catch {
            return .failure(error)
        }
    }
}
