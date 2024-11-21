//
//  TC2007B_ExamenApp.swift
//  TC2007B_Examen
//
//  Created by Hiram Mendoza  on 21/11/24.
//

import SwiftUI
import ParseCore
import UIKit
@main
struct TC2007B_ExamenApp: App {
    
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate

    var body: some Scene {
        WindowGroup {
            HelloView(viewModel: HelloViewModel(repository: HelloRepository()))
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let configuration = ParseClientConfiguration {
            $0.applicationId = ParseConfig.applicationId
            $0.clientKey = ParseConfig.clientKey
            $0.server = ParseConfig.serverUrl
        }
        Parse.initialize(with: configuration)

        return true
    }
}

