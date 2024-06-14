//
//  EntryDetailView.swift
//  Hypnago
//
//  Created by Nathan on 6/13/24.
//

import SwiftUI
import SwiftData

struct EntryDetailView: View {
    @Environment(\.modelContext) var modelContext
//    @Environment(JournalModel.self) var journalModel

    let entry: Entry
//    let dateAsString: String
    
    var body: some View {
        VStack {
            Text(entry.title)
                .font(.title.bold())
//            Text(dateAsString)
//                .padding()
            Text(entry.entry)
        }
        .padding()
        .navigationTitle(entry.title)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Entry.self, configurations: config)
    let sampleEntry = Entry(title: "Marketing Campaign", date: Date(), entry: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. In metus vulputate eu scelerisque felis imperdiet proin fermentum leo.")
    let sampleDate = "Friday June 13, 2024"
    
//    return EntryDetailView(entry: sampleEntry, dateAsString: sampleDate)
    return EntryDetailView(entry: sampleEntry)
       .modelContainer(container)
}
