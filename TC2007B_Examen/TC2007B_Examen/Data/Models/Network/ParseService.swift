//
//  Appdelegate.swift
//  ExamenTC2007B
//
//  Created by Hiram Mendoza  on 21/11/24.
//

import Foundation
import ParseCore

class NetworkAPIService {
    static let shared = NetworkAPIService()

    /// Calls a cloud function asynchronously and returns the result.
    func callCloudFunction<T>(
        functionName: String,
        params: [String: Any]
    ) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            PFCloud.callFunction(inBackground: functionName, withParameters: params) { (result, error) in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let result = result as? T {
                    continuation.resume(returning: result)
                } else {
                    let parseError = NSError(domain: "ParseError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unexpected type of result"])
                    continuation.resume(throwing: parseError)
                }
            }
        }
    }

    func fetchHelloPage(page: Int) async throws -> [HistoricalData] {
        let params: [String: Any] = ["page": page]
        let result: [String: Any] = try await callCloudFunction(functionName: "hello", params: params)

        // Validar si los datos son correctos
        guard let dataArray = result["data"] as? [PFObject] else {
            throw NSError(domain: "ParseError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid response structure"])
        }

        // Convertir cada objeto `PFObject` a `HistoricalData`
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
