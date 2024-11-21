//
//  HistorialCellView.swift
//  ExamenTC2007B
//
//  Created by Hiram Mendoza  on 21/11/24.
//

import SwiftUI

/// A view that displays a single historical data entry.
struct HistoricalCellView: View {
    /// The `HistoricalData` object to display.
    let historical: HistoricalData

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Fecha del evento.
            Text(historical.date)
                .font(.headline)
                .foregroundColor(.blue)
            
            // Descripción del evento.
            Text(historical.description)
                .font(.subheadline)
                .foregroundColor(.primary)
            
            // Categorías del evento.
            HStack {
                Text(historical.category1)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                Text(historical.category2)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

/// Preview for `HistoricalCellView`.
struct HistoricalCellView_Previews: PreviewProvider {
    static var previews: some View {
        HistoricalCellView(historical: HistoricalData(
            date: "202 BC",
            description: "Rome defeats Carthage in the Second Punic War, leading to the end of the Carthaginian Empire.",
            lang: "en",
            category1: "By event",
            category2: "Rome",
            granularity: "year",
            createdAt: "2024-11-20T23:24:04.010Z",
            updatedAt: "2024-11-20T23:24:04.010Z",
            objectId: "sampleObjectId",
            className: "Historical"
        ))
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
