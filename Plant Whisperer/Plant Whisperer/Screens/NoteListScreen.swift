//
//  NoteListScreen.swift
//  Plant Whisperer
//
//  Created by Jason Sanchez on 4/6/25.
//

import SwiftUI
import SwiftData

struct NoteListScreen: View {
    let myGardenVegetable: MyGardenVegetable
    @State private var addNotePresented: Bool = false
    @Environment(\.modelContext) private var context
    
    private func deleteNote(at indexSet: IndexSet) {
        guard let notes = myGardenVegetable.notes else { return }
        for index in indexSet {
            let note = notes[index]
            context.delete(note)
            // remove the note from myGardenVegetable.notes too
            guard let noteToRemoveIndex = notes.firstIndex(where: { $0.persistentModelID == note.persistentModelID }) else { return }
            myGardenVegetable.notes?.remove(at: noteToRemoveIndex)
            try? context.save()
        }
    }
    var body: some View {
        List {
            ForEach(myGardenVegetable.notes ?? []) { note in
                NoteCellView(note: note, placeHolderImage: myGardenVegetable.vegetable.thumbnailImage)
            }.onDelete(perform: deleteNote)
        }
        .navigationTitle(myGardenVegetable.vegetable.name)
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
  
#Preview(traits: .sampleData) {
    @Previewable @Query var myGardenVegetables: [MyGardenVegetable]
    NavigationStack {
        NoteListScreen(myGardenVegetable: myGardenVegetables[0])
    }
}
