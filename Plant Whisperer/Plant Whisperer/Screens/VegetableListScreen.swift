//
//  VegetableListScreen.swift
//  Plant Whisperer
//
//  Created by Jason Sanchez on 4/1/25.
//

import SwiftUI

struct VegetableListScreen: View {
    @State private var vegetables: [Vegetable] = []
    
    var body: some View {
        List(vegetables) { vegetable in
            NavigationLink {
                VegetableCellView(vegetable: vegetable)
            } label: {
                VegetableCellView(vegetable: vegetable)
            }
        }
        .listStyle(.plain)
        .task {
            do {
                let client = VegetableHTTPClient()
                vegetables = try await client.fetchVegetables()
            } catch {
                print(error.localizedDescription)
            }
        }.navigationTitle("Vegetables")
    }
}

#Preview {
    VegetableListScreen()
}
