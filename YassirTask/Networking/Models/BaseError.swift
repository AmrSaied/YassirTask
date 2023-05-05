//
//  BaseError.swift
//  YassirTask
//
//  Created by Amr Saied on 04/05/2023.
//

import Foundation
 
struct BaseError: Error {
    let code: Int
    let message: String
}

extension BaseError: Equatable {}
