//
//  HistoricalVIewModel.swift
//  ExamenTC2007B
//
//  Created by Hiram Mendoza  on 21/11/24.
//

import Foundation

/// A view model for managing and displaying historical data.
///
/// This class fetches historical data from a repository, handles errors, and updates the UI via published properties.
class HistoricalViewModel: ObservableObject {
    
    // MARK: - Dependencies
    
    /// The repository responsible for fetching historical data.
    private let repository: HistoricalProtocol

    // MARK: - Published Properties
    
    /// The list of historical data records to be displayed in the UI.
    @Published var historicalData: [HistoricalData] = []
    
    /// An error message to be displayed in case of a data fetch failure.
    @Published var error: String = ""

    // MARK: - Initializer
    
    /// Initializes the view model with the required repository.
    ///
    /// - Parameter repository: An implementation of the HistoricalProtocol for fetching data.
    init(repository: HistoricalProtocol) {
        self.repository = repository
    }

    // MARK: - Public Methods
    
    /// Fetches a page of historical data based on the provided requirement.
    ///
    /// - Parameter requirement: A FetchHistoricalDataRequirement object specifying the parameters for the fetch operation.
    ///
    /// This method performs the following steps:
    /// 1. Calls the repository's fetchHelloPage(page:) method asynchronously.
    /// 2. Updates the historicalData property on success.
    /// 3. Updates the error property with an appropriate message on failure.
    func fetchHelloPage(requirement: FetchHistoricalDataRequirement) {
        // Executes the data fetch operation in an asynchronous task.
        Task {
            do {
                // Attempt to fetch the historical data using the repository.
                let data = try await repository.fetchHelloPage(page: requirement.page)
                
                // Update the historical data on the main thread.
                DispatchQueue.main.async {
                    self.historicalData = data
                    self.error = ""
                }
            } catch {
                // Update the error message on the main thread if fetching fails.
                DispatchQueue.main.async {
                    self.error = "Internal Server Error. Our monkeys are not working today and the devs go out for an exam."
                }
            }
        }
    }
}
