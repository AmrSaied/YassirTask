//
//  MockMoviesListRepository.swift
//  YassirTaskTests
//
//  Created by Amr Saied on 26/05/2023.
//

@testable import YassirTask
import RxSwift
import RxTest

final class MockValidMoviesListRepository: DisposeObject, MoviesListRepositoryProtocol {
    func fetchMovies(
        using pageIndex: Int
    ) -> Observable<Result<MoviesResponse, BaseError>> {
        
        return  Observable<Result<MoviesResponse, BaseError>>.just(
            .success(MockData.moviesResponse)
        )
    }
}

final class MockInValidMoviesListRepository: DisposeObject, MoviesListRepositoryProtocol {
    func fetchMovies(
        using pageIndex: Int
    ) -> Observable<Result<MoviesResponse, BaseError>> {

        return  Observable<Result<MoviesResponse, BaseError>>.just(
            .failure(MockData.unexpectedError)
        )
    }
}
