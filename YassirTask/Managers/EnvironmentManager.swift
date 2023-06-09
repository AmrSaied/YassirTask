//
//  EnvironmentManager.swift
//  YassirTask
//
//  Created by Amr Saied on 04/05/2023.
//
 
import Foundation

final class EnvironmentManager {
    
    enum UserDefined: String {
        case serverScheme = "SERVER_SCHEME"
        case serverHost = "SERVER_HOST"
        case apiKey = "MOVIES_API_KEY"
        case apiAccessToken = "MOVIES_API_ACCESS_TOKEN"
        case imageURL = "MOVIE_IMAGE_URL"
    }
    
    static let shared = EnvironmentManager()
    
    private var infoDict: [String: Any]
    
    private init() {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Couldn't find plist file")
        }
        
        infoDict = dict
    }
    
    /// Method to fetch String value from Info.plist
    /// - Parameter key: Key to fetch from Info.plist
    /// - Returns: Value fetched from Info.plist
    func string(key: UserDefined) -> String {
        return self.fetch(key: key.rawValue)
    }
    
    /// Method to fetch Boolean value from Info.plist
    /// - Parameter key: Key to fetch from Info.plist
    /// - Returns: Value fetched from Info.plist
    func boolean(key: UserDefined) -> Bool {
        return self.infoDict[key.rawValue] as? Bool ?? false
    }
    
    /// Method to fetch Dictionary value from Info.plist
    /// - Parameter key: Key to fetch from Info.plist
    /// - Returns: Value fetched from Info.plist
    func dictionary(key: UserDefined) -> [String: Any] {
        return (self.infoDict[key.rawValue] as? [String: Any]).value
    }
    
    /// Method to fetch String value from Info.plist
    /// - Parameter key: Key to fetch from Info.plist
    /// - Returns: Value fetched from Info.plist
    private func fetch(key: String) -> String {
        return (self.infoDict[key] as? String).value
    }
}
