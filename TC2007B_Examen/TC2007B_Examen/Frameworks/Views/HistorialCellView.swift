//
//  HistorialCellView.swift
//  ExamenTC2007B
//
//  Created by Hiram Mendoza  on 21/11/24.
//

import SwiftUI

/// A view that displays a single historical data entry.
///
/// This view is designed to showcase a HistoricalData object, including its date, description, and category.
struct HistoricalCellView: View {
    /// The HistoricalData object to display in the cell.
    let historical: HistoricalData
    
    var body: some View {
        ZStack {
            // MARK: Background
            // A background image styled for the cell.
            Image("bg-white")
                .resizable()
                .cornerRadius(8) // Rounds the corners of the image.
                .clipped() // Ensures content stays within the bounds of the image.
            
            // MARK: Cell Content
            VStack(alignment: .leading, spacing: 8) {
                // MARK: Header
                // Displays the date of the historical event.
                Text(historical.date)
                    .font(.headline) // Styled as a headline.
                    .foregroundColor(.white) // White text color.
                    .padding() // Adds padding around the text.
                    .frame(maxWidth: .infinity) // Expands horizontally.
                    .background(Color.black) // Black background for contrast.
                
                // MARK: Description
                // Displays a brief description of the historical event.
                Text(historical.description)
                    .font(.subheadline) // Styled as a subheadline.
                    .foregroundColor(.primary) // Uses the primary color for text.
                    .padding(.vertical, 4) // Adds vertical padding.
                
                // MARK: Categories
                // Displays the secondary category of the historical event.
                HStack {
                    Text(historical.category2)
                        .font(.footnote) // Styled as a footnote.
                        .foregroundColor(.secondary) // Uses the secondary color for text.
                }
            }
            .padding() // Adds internal spacing for the cell content.
        }
        .cornerRadius(12) // Rounds the corners of the entire cell.
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2) // Adds a subtle shadow for depth.
    }
}
