//
//  APIConstants.swift
//  YassirTask
//
//  Created by Amr Saied on 04/05/2023.
//

import Foundation
 
enum APIConstants: String, CaseIterable {
    case discoverMovies = "/3/discover/movie?page=%@"
    case movieDetails = "/3/movie/%@?"
}
