//
//  MockReachability.swift
//  YassirTaskTests
//
//  Created by Amr Saied on 26/05/2023.
//

@testable import YassirTask

final class MockConnectedConectivity: ConectivityProtocol {
    func isConnectedToNetwork() -> Bool {
        return true
    }
}

final class MockNotConnectedConectivity: ConectivityProtocol {
    func isConnectedToNetwork() -> Bool {
        return false
    }
}
