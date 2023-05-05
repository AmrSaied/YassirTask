//
//  ErrorResolver.swift
//  YassirTask
//
//  Created by Amr Saied on 04/05/2023.
//

import Foundation
 
final class ErrorResolver {
    static let shared = ErrorResolver()
    
    private init() {}
    
    func getError(for type: ErrorType) -> BaseError {
        return .init(
            code: type.code,
            message: type.message
        )
    }
    
    func getError(with error: Error) -> BaseError {
        return BaseError(
            code: -1,
            message: error.localizedDescription
        )
    }
}
