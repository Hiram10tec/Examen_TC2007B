//
//  HistoricalRequiriment.swift
//  ExamenTC2007B
//
//  Created by Hiram Mendoza  on 21/11/24.
//

import Foundation

/// A structure representing the parameters required to fetch historical data.
///
/// This structure encapsulates the details needed to perform a paginated fetch operation for historical data records.
struct FetchHistoricalDataRequirement {
    /// The page number to fetch.
    ///
    /// This parameter specifies which page of historical data should be retrieved from the backend.
    let page: Int
}
