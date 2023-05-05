//
//  MoviesListRepositoryProtocol.swift
//  YassirTask
//
//  Created by Amr Saied on 04/05/2023.
//

import RxSwift

protocol MoviesListRepositoryProtocol {
    func fetchMovies(
        using pageIndex: Int
    ) -> Observable<Result<MoviesResponse, BaseError>>
}
 
