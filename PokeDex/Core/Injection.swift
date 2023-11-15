//
//  Injection.swift
//  PokeDex
//
//  Created by Dodi Aditya on 15/11/23.
//

import Foundation

struct Injection {
    static let shared = Injection()
    
    func provideGetPokemonsUseCase() -> GetPokemonsUseCaseImpl {
        return GetPokemonsUseCaseImpl(repo: PokemonRepositoryImpl.sharedInstance(RemoteDataSource.shared))
    }
}
