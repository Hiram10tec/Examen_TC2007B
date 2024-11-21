//
//  ParesConfig.swift
//  ExamenTC2007B
//
//  Created by Hiram Mendoza  on 21/11/24.
//

import Foundation

struct ParseConfig {
    static var applicationId: String {
        guard let config = Bundle.main.object(forInfoDictionaryKey: "Parse") as? [String: Any],
              let value = config["ApplicationId"] as? String else {
            fatalError("ApplicationId not found in Info.plist")
        }
        return value
    }

    static var clientKey: String {
        guard let config = Bundle.main.object(forInfoDictionaryKey: "Parse") as? [String: Any],
              let value = config["ClientKey"] as? String else {
            fatalError("ClientKey not found in Info.plist")
        }
        return value
    }

    static var serverUrl: String {
        guard let config = Bundle.main.object(forInfoDictionaryKey: "Parse") as? [String: Any],
              let value = config["ServerUrl"] as? String else {
            fatalError("ServerUrl not found in Info.plist")
        }
        return value
    }
}
