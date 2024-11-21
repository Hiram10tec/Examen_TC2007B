//
//  Appdelegate.swift
//  ExamenTC2007B
//
//  Created by Hiram Mendoza  on 21/11/24.
//
import Foundation
import ParseCore

/// A singleton service for interacting with the backend API.
///
/// NetworkAPIService provides methods to call cloud functions and fetch data asynchronously.
class NetworkAPIService {
    // MARK: - Singleton Instance

    /// Shared instance of the NetworkAPIService to be used throughout the application.
    static let shared = NetworkAPIService()

    // MARK: - Cloud Function Caller

    /// Calls a Parse cloud function asynchronously and returns the result.
    ///
    /// - Parameters:
    ///   - functionName: The name of the cloud function to be called.
    ///   - params: A dictionary of parameters to send to the cloud function.
    /// - Returns: The result of the cloud function, cast to the specified generic type T.
    /// - Throws: An error if the cloud function fails or the result cannot be cast to type T.
    func callCloudFunction<T>(
        functionName: String,
        params: [String: Any]
    ) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            // Call the cloud function asynchronously.
            PFCloud.callFunction(inBackground: functionName, withParameters: params) { (result, error) in
                if let error = error {
                    // Resume with an error if the cloud function fails.
                    continuation.resume(throwing: error)
                } else if let result = result as? T {
                    // Resume with the result if the cast to type T is successful.
                    continuation.resume(returning: result)
                } else {
                    // Resume with an error if the result cannot be cast to type T.
                    let parseError = NSError(
                        domain: "ParseError",
                        code: -1,
                        userInfo: [NSLocalizedDescriptionKey: "Unexpected type of result"]
                    )
                    continuation.resume(throwing: parseError)
                }
            }
        }
    }

    // MARK: - Fetch Hello Page

    /// Fetches a page of historical data from the backend.
    ///
    /// - Parameter page: The page number to fetch.
    /// - Returns: An array of HistoricalData objects for the specified page.
    /// - Throws: An error if the cloud function fails or the response structure is invalid.
    func fetchHelloPage(page: Int) async throws -> [HistoricalData] {
        let params: [String: Any] = ["page": page]

        // Call the "hello" cloud function and fetch the raw result.
        let result: [String: Any] = try await callCloudFunction(functionName: "hello", params: params)

        // Validate the response structure.
        guard let dataArray = result["data"] as? [PFObject] else {
            throw NSError(
                domain: "ParseError",
                code: -1,
                userInfo: [NSLocalizedDescriptionKey: "Invalid response structure"]
            )
        }

        // Map each PFObject in the data array to a HistoricalData instance.
        return dataArray.compactMap { object in
            guard let date = object["date"] as? String,
                  let description = object["description"] as? String,
                  let lang = object["lang"] as? String,
                  let category1 = object["category1"] as? String,
                  let category2 = object["category2"] as? String,
                  let granularity = object["granularity"] as? String,
                  let createdAt = object.createdAt?.description,
                  let updatedAt = object.updatedAt?.description,
                  let objectId = object.objectId else {
                return nil
            }

            // Return a new HistoricalData instance if all required fields are present.
            return HistoricalData(
                date: date,
                description: description,
                lang: lang,
                category1: category1,
                category2: category2,
                granularity: granularity,
                createdAt: createdAt,
                updatedAt: updatedAt,
                objectId: objectId,
                className: object.parseClassName
            )
        }
    }
}
