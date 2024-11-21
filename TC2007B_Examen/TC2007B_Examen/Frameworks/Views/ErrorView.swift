//
//  ErrorView.swift
//  TC2007B_Examen
//
//  Created by Hiram Mendoza  on 21/11/24.
//

import SwiftUI

/// A view displayed when an error occurs.
///
/// `ErrorView` provides a user-friendly interface for displaying error messages with an optional image.
/// It consists of a styled message container and a visual representation (e.g., a placeholder image).
struct ErrorView: View {
    // MARK: - Properties
    
    /// The name of the image to display.
    let imageName: String
    
    /// A list of message lines to display in the error message.
    let messageLines: [String]

    // MARK: - Body

    var body: some View {
        VStack(spacing: 20) {
            // MARK: Error Message Section
            VStack(spacing: 10) {
                ForEach(messageLines, id: \.self) { line in
                    Text(line) // Display each line of the message.
                        .font(.headline) // Styled as a headline for emphasis.
                        .foregroundColor(.black) // Black text color for readability.
                        .multilineTextAlignment(.center) // Center-align the text.
                }
            }
            .padding() // Adds padding inside the message container.
            .background(Color.white) // White background for the message box.
            .cornerRadius(12) // Rounds the corners of the message box.
            .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4) // Adds a shadow for depth.

            // MARK: Image Section
            Image(imageName) // Displays the provided image.
                .resizable() // Makes the image resizable.
                .scaledToFit() // Ensures the image maintains its aspect ratio.
                .frame(maxWidth: 350, maxHeight: 500) // Limits the maximum size of the image.
                .cornerRadius(12) // Rounds the corners of the image.
                .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4) // Adds a shadow for depth.

            Spacer() // Adds flexible space below the content.
        }
        .padding() // Adds padding around the entire view.
    }
}

// MARK: - Preview

/// A preview of the `ErrorView` for design-time visualization.
///
/// This preview demonstrates the layout and styling of the error view with sample data.
struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(
            imageName: "meme", // Example image name.
            messageLines: [
                "Error in the connection", // Example error message.
                "(I'll be back after the exam),",
                "in the meantime, enjoy this meme:"
            ]
        )
        .previewLayout(.sizeThatFits) // Fits the preview to the view's size.
    }
}
