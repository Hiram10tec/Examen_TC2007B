//
//  HistoricalVIewModel.swift
//  ExamenTC2007B
//
//  Created by Hiram Mendoza  on 21/11/24.
//

import Foundation

class HelloViewModel: ObservableObject {
    private let repository: HelloRepositoryProtocol

    @Published var historicalData: [HistoricalData] = []
    @Published var error: String = ""

    init(repository: HelloRepositoryProtocol) {
        self.repository = repository
    }

    /// Fetch historical data based on the provided requirement.
    func fetchHelloPage(requirement: FetchHistoricalDataRequirement) {
        Task {
            do {
                let data = try await repository.fetchHelloPage(page: requirement.page)
                DispatchQueue.main.async {
                    self.historicalData = data
                }
            } catch {
                DispatchQueue.main.async {
                    self.error = error.localizedDescription
                }
            }
        }
    }
}
