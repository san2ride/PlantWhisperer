//
//  MyGardenScreen.swift
//  Plant Whisperer
//
//  Created by Jason Sanchez on 4/4/25.
//

import SwiftUI
import SwiftData

struct MyGardenScreen: View {
    
    @Query private var myGardenVegetables: [MyGardenVegetable]
    var body: some View {
        List(myGardenVegetables) { myGardenVegetable in
            MyGardenCellView(myGardenVegetable: myGardenVegetable)
        }
        .listStyle(.plain)
        .navigationTitle("My Garden")
    }
}

#Preview {
    NavigationStack {
        MyGardenScreen()
    }.modelContainer(previewContainer)
}
