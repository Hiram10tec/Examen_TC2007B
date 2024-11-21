//
//  HistoricalRepository.swift
//  ExamenTC2007B
//
//  Created by Hiram Mendoza  on 21/11/24.
//

import Foundation

/// A protocol defining the requirements for fetching historical data.
///
/// This protocol specifies a method for fetching historical data records from a remote source, based on pagination.
protocol HistoricalProtocol {
    /// Fetches a specific page of historical data.
    ///
    /// - Parameter page: The page number to fetch.
    /// - Returns: An array of HistoricalData objects corresponding to the requested page.
    /// - Throws: An error if the fetch operation fails.
    func fetchHelloPage(page: Int) async throws -> [HistoricalData]
}

/// A concrete implementation of the HistoricalProtocol.
///
/// This class uses the NetworkAPIService to fetch historical data from a remote API.
class HistoricalRepository: HistoricalProtocol {
    
    /// Fetches a specific page of historical data by delegating the operation to the NetworkAPIService.
    ///
    /// - Parameter page: The page number to fetch.
    /// - Returns: An array of HistoricalData objects corresponding to the requested page.
    /// - Throws: An error if the fetch operation fails.
    func fetchHelloPage(page: Int) async throws -> [HistoricalData] {
        // Calls the NetworkAPIService to fetch the data asynchronously.
        return try await NetworkAPIService.shared.fetchHelloPage(page: page)
    }
}
