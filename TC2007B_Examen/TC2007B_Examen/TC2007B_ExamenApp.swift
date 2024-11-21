//
//  TC2007B_ExamenApp.swift
//  TC2007B_Examen
//
//  Created by Hiram Mendoza  on 21/11/24.
//

import SwiftUI
import ParseCore
import UIKit

/// The main entry point of the TC2007B_ExamenApp.
///
/// This structure defines the app's lifecycle and initial view.
@main
struct TC2007B_ExamenApp: App {
    
    // MARK: - Properties

    /// The app delegate responsible for handling app lifecycle events.
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate

    // MARK: - Body

    /// The main scene of the application.
    ///
    /// This scene initializes the `HelloView` with its `HelloViewModel`, which is connected to a `HelloRepository`.
    var body: some Scene {
        WindowGroup {
            HistoricalView(viewModel: HistoricalViewModel(repository: HistoricalRepository()))
        }
    }
}

/// The app delegate responsible for managing application lifecycle events.
///
/// This class configures the Parse client during the app launch.
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Application Lifecycle
    
    /// Configures the Parse client when the application finishes launching.
    ///
    /// - Parameters:
    ///   - application: The singleton app object.
    ///   - launchOptions: A dictionary indicating the reason the app was launched (e.g., a URL or notification).
    /// - Returns: A boolean value indicating whether the app launched successfully.
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // MARK: Parse Client Configuration
        let configuration = ParseClientConfiguration {
            $0.applicationId = ParseConfig.applicationId // Application ID retrieved from ParseConfig.
            $0.clientKey = ParseConfig.clientKey // Client key retrieved from ParseConfig.
            $0.server = ParseConfig.serverUrl // Server URL retrieved from ParseConfig.
        }
        // Initialize the Parse client with the specified configuration.
        Parse.initialize(with: configuration)

        return true
    }
}
