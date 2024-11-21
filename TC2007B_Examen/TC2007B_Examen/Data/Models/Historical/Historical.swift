//
//  Historical.swift
//  ExamenTC2007B
//
//  Created by Hiram Mendoza  on 21/11/24.
//


import Foundation

/// A structure representing historical data, conforming to the Codable protocol.
///
/// This structure is used to parse and encode historical data records, typically retrieved from or sent to a backend.
struct HistoricalData: Codable {
    
    // MARK: - Properties

    /// The date associated with the historical record.
    let date: String

    /// A description of the historical event or data.
    let description: String

    /// The language of the description, represented as a language code (e.g., "en" for English).
    let lang: String

    /// The primary category associated with the historical record.
    let category1: String

    /// The secondary category associated with the historical record.
    let category2: String

    /// The granularity of the data (e.g., "day", "month", "year").
    let granularity: String

    /// The timestamp indicating when the record was created, in ISO 8601 format.
    let createdAt: String

    /// The timestamp indicating when the record was last updated, in ISO 8601 format.
    let updatedAt: String

    /// A unique identifier for the historical record.
    let objectId: String

    /// The class name associated with the data, typically used in backend systems.
    let className: String
}
