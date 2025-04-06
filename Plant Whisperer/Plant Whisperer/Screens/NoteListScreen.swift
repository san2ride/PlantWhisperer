//
//  NoteListScreen.swift
//  Plant Whisperer
//
//  Created by Jason Sanchez on 4/6/25.
//

import SwiftUI

struct NoteListScreen: View {
    let myGardenVegetable: MyGardenVegetable
    @State private var addNotePresented: Bool = false
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Note") {
                        addNotePresented = true
                    }
                }
            }.sheet(isPresented: $addNotePresented) {
                NavigationStack {
                    AddNoteScreen(myGardenVegetable: myGardenVegetable)
                }
            }
    }
}

#Preview {
    NavigationStack {
        NoteListScreen(myGardenVegetable: MyGardenVegetable(vegetable:
            PreviewData.loadVegetables()[0], plantOption: .seed))
    }
}
