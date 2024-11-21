//
//  HistoricalView.swift
//  ExamenTC2007B
//
//  Created by Hiram Mendoza  on 21/11/24.
//
import SwiftUI

/// A view that displays historical data or an error message.
///
/// This view uses the HistoricalViewModel to fetch and display historical data in a scrollable list.
/// If an error occurs, it displays an error message with a placeholder image.
struct HistoricalView: View {
    // MARK: - Properties
    
    /// The view model responsible for managing the state and fetching historical data.
    @StateObject var viewModel: HistoricalViewModel

    // MARK: - Body
    
    var body: some View {
        ZStack {
            // MARK: Background
            // A full-screen background image styled for the view.
            Image("bg-sky")
                .resizable()
                .scaledToFill() // Ensures the image scales to fill the entire screen.
                .edgesIgnoringSafeArea(.all) // Extends the background beyond safe areas.

            if viewModel.error.isEmpty {
                // MARK: Main Content
                VStack(spacing: 0) {
                    // MARK: Title Section
                    VStack {
                        Text("Historical Data")
                            .font(.system(size: 28, weight: .bold, design: .rounded)) // Custom font for the title.
                            .foregroundColor(.black) // Black text for contrast.
                            .padding() // Adds padding around the text.
                            .frame(maxWidth: .infinity, alignment: .center) // Centers the title horizontally.
                            .background(
                                // Gradient background for the title.
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.white.opacity(0.9), Color.gray.opacity(0.5)]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .cornerRadius(12) // Rounds the corners of the title background.
                            .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 2) // Adds a shadow for depth.
                    }
                    .padding(.horizontal) // Horizontal padding for the title section.

                    // MARK: Historical Data List
                    ScrollView {
                        // A vertical stack displaying the list of historical data cells.
                        VStack(spacing: 30) { // Spacing between cells.
                            ForEach(viewModel.historicalData, id: \.objectId) { item in
                                HistoricalCellView(historical: item)
                                    .padding() // Adds internal padding for the cell.
                                    .background(Color.white.opacity(0.9)) // White background with slight transparency.
                                    .cornerRadius(12) // Rounds the corners of the cell.
                                    .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 2) // Adds a subtle shadow.
                            }
                        }
                        .padding(.horizontal, 16) // Horizontal padding for the list.
                        .padding(.vertical, 20) // Vertical padding for separation from the edges.
                    }
                }
            } else {
                // MARK: Error View
                // Displays a custom error message and placeholder image when an error occurs.
                ErrorView(
                    imageName: "meme",
                    messageLines: [
                        "Error en la conexión", // Error description.
                        "(Lo arreglo terminando el examen),", // Additional context.
                        "por mientras les dejo un meme:" // Placeholder message.
                    ]
                )
            }
        }
        // MARK: Fetch Data on Appear
        .onAppear {
            // Fetches the first page of historical data when the view appears.
            viewModel.fetchHelloPage(requirement: FetchHistoricalDataRequirement(page: 1))
        }
        // MARK: Error Alert
        .alert(isPresented: .constant(!viewModel.error.isEmpty)) {
            // Displays an alert if there is an error in the view model.
            Alert(
                title: Text("Error"),
                message: Text(viewModel.error),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}
