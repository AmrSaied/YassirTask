//
//  Optional+Ext.swift
//  YassirTask
//
//  Created by Amr Saied on 04/05/2023.
//

import Foundation
 
extension Optional where Wrapped == String {
    var value: String {
        return self ?? ""
    }
}

extension Optional {
    var isNil: Bool {
        self == nil
    }
    
    var isNotNil: Bool {
        !isNil
    }
}

extension Optional where Wrapped == String {
    /// return is Empty Or Nil value
    var isEmptyOrNil: Bool {
        self?.isEmpty ?? true
    }
}

extension Optional where Wrapped == Date {
    /// return date if not nil Or retutn dafault value  `Date()` if nil
    var value: Date {
        self ?? Date()
    }
}

extension Optional where Wrapped == Bool {
    /// return date if not nil Or retutn dafault value  `Bool` if nil
    var value: Bool {
        self ?? false
    }
}
