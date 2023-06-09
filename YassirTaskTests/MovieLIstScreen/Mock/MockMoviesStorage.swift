//
//  MockMoviesStorage.swift
//  YassirTaskTests
//
//  Created by Amr Saied on 26/05/2023.
//

@testable import YassirTask
import RxTest
import RxSwift

final class MockValidMoviesStorage: DisposeObject, MoviesStorageProtocol {
    
    func fetchWithOffset(sortDescriptors: [NSSortDescriptor], fetchOffset: Int) -> Observable<Result<[MovieData], BaseError>> {
        return  Observable<Result<[MovieData], BaseError>>.just(
            .success(MockData.moviesData)
        )
    }
    
    func fetchMoviesCount() -> Int {
        return MockData.moviesResponse.totalPages ?? 20
    }
    
    func saveAll(_ movies: [MovieData]) {}
    
    func save(_ movieData: MovieData) {}
    
    func deleteAll() {}
}

final class MockInValidMoviesStorage: DisposeObject, MoviesStorageProtocol {
    
    func fetchWithOffset(sortDescriptors: [NSSortDescriptor], fetchOffset: Int) -> Observable<Result<[MovieData], BaseError>> {
        return  Observable<Result<[MovieData], BaseError>>.just(
            .failure(MockData.unexpectedError)
        )
    }
    
    func fetchMoviesCount() -> Int {
        return MockData.moviesResponse.totalPages ?? 20
    }
    
    func saveAll(_ movies: [MovieData]) {}
    
    func save(_ movieData: MovieData) {}
    
    func deleteAll() {}
}
