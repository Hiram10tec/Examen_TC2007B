//
//  HistoricalRepository.swift
//  ExamenTC2007B
//
//  Created by Hiram Mendoza  on 21/11/24.
//

import Foundation

protocol HelloRepositoryProtocol {
    func fetchHelloPage(page: Int) async throws -> [HistoricalData]
}

class HelloRepository: HelloRepositoryProtocol {
    func fetchHelloPage(page: Int) async throws -> [HistoricalData] {
        return try await NetworkAPIService.shared.fetchHelloPage(page: page)
    }
}
