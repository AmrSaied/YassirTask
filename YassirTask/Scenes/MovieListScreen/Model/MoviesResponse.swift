//
//  MoviesResponse.swift
//  YassirTask
//
//  Created by Amr Saied on 04/05/2023.
//

import Foundation
 
struct MoviesResponse: Decodable {
    let page: Int?
    let results: [MovieData]?
    let totalPages: Int?
    let totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    init(
        page: Int? = nil,
        results: [MovieData]?,
        totalPages: Int?,
        totalResults: Int? = nil
    ) {
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}
