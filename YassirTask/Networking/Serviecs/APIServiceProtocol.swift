//
//  APIServiceProtocol.swift
//  YassirTask
//
//  Created by Amr Saied on 04/05/2023.
//
 
import RxSwift

protocol APIServiceProtocol {
    func request<T: Decodable>(
        using request: URLRequest,
        responseType: T.Type,
        decoder: JSONDecoder,
        retry: Int
    ) -> Observable<Result<T, BaseError>>
}

extension APIServiceProtocol {
    func request<T: Decodable>(
        using request: URLRequest,
        responseType: T.Type = T.self,
        decoder: JSONDecoder = .init(),
        retry: Int = NetworkConstants.retries
    ) -> Observable<Result<T, BaseError>> {
        self.request(
            using: request,
            responseType: responseType,
            decoder: JSONDecoder(),
            retry: NetworkConstants.retries
        )
    }
}
