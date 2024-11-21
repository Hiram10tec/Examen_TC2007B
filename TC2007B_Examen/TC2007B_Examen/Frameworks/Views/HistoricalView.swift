//
//  HistoricalView.swift
//  ExamenTC2007B
//
//  Created by Hiram Mendoza  on 21/11/24.
//

import SwiftUI

struct HelloView: View {
    @StateObject var viewModel: HelloViewModel

    var body: some View {
        NavigationView {
            List(viewModel.historicalData, id: \.objectId) { item in
                VStack(alignment: .leading) {
                    Text(item.date)
                        .font(.headline)
                    Text(item.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .navigationTitle("Historical Data")
            .onAppear {
                viewModel.fetchHelloPage(requirement: FetchHistoricalDataRequirement(page: 1))
            }
            .alert(isPresented: .constant(!viewModel.error.isEmpty)) {
                Alert(title: Text("Error"), message: Text(viewModel.error), dismissButton: .default(Text("OK")))
            }
        }
    }
}
