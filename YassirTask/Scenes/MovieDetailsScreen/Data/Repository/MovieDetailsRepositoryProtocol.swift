//
//  MovieDetailsRepositoryProtocol.swift
//  YassirTask
//
//  Created by Amr Saied on 05/05/2023.
//
 
import RxSwift

protocol MovieDetailsRepositoryProtocol {
    func fetchMovieDetails(
        using movieID: Int
    ) -> Observable<Result<MovieData, BaseError>>
}
