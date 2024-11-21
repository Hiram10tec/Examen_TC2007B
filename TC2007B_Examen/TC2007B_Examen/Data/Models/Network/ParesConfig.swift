//
//  ParesConfig.swift
//  ExamenTC2007B
//
//  Created by Hiram Mendoza  on 21/11/24.
//

import Foundation

/// A structure for accessing Parse configuration values from the app's `Info.plist`.
///
/// `ParseConfig` provides a centralized and type-safe way to retrieve the `ApplicationId`, `ClientKey`,
/// and `ServerUrl` required for Parse SDK configuration. These values are expected to be stored under a
/// custom key ("Parse") in the app's `Info.plist`.
struct ParseConfig {

    // MARK: - Application ID

    /// Retrieves the `ApplicationId` for the Parse configuration.
    ///
    /// - Returns: A `String` containing the `ApplicationId`.
    /// - Throws: A runtime error if the `ApplicationId` is not found or is not properly configured in the `Info.plist`.
    static var applicationId: String {
        guard let config = Bundle.main.object(forInfoDictionaryKey: "Parse") as? [String: Any],
              let value = config["ApplicationId"] as? String else {
            fatalError("ApplicationId not found in Info.plist")
        }
        return value
    }

    // MARK: - Client Key

    /// Retrieves the `ClientKey` for the Parse configuration.
    ///
    /// - Returns: A `String` containing the `ClientKey`.
    /// - Throws: A runtime error if the `ClientKey` is not found or is not properly configured in the `Info.plist`.
    static var clientKey: String {
        guard let config = Bundle.main.object(forInfoDictionaryKey: "Parse") as? [String: Any],
              let value = config["ClientKey"] as? String else {
            fatalError("ClientKey not found in Info.plist")
        }
        return value
    }

    // MARK: - Server URL

    /// Retrieves the `ServerUrl` for the Parse configuration.
    ///
    /// - Returns: A `String` containing the `ServerUrl`.
    /// - Throws: A runtime error if the `ServerUrl` is not found or is not properly configured in the `Info.plist`.
    static var serverUrl: String {
        guard let config = Bundle.main.object(forInfoDictionaryKey: "Parse") as? [String: Any],
              let value = config["ServerUrl"] as? String else {
            fatalError("ServerUrl not found in Info.plist")
        }
        return value
    }
}
