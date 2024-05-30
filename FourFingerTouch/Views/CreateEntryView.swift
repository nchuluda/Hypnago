//
//  CreateEntryView.swift
//  FourFingerTouch
//
//  Created by Nathan on 5/23/24.
//

import SwiftUI

struct CreateEntryView: View {
    @Environment(AppManager.self) var appManager
    @Environment(JournalModel.self) var journalModel
    @State var entry: String = ""
    
    var body: some View {
        VStack {
            Text("Where did your mind go?")
                .font(.title.bold())
            Form {
                Section(header: Text("Record your new ideas here:")) {
                    TextEditor(text: $entry)
                }
                
                Button("Submit", action: {
                    appManager.entry = self.entry
                    if let title = appManager.title,
                       let entry = appManager.entry {
                        journalModel.storedJournals.append(Entry(title: title, date: Date(), entry: entry))
                        appManager.title = nil
                        appManager.entry = nil
                    }
                    appManager.appState = .history
                })
                .disabled(self.entry.isEmpty)
            }
        }
    }
}

#Preview {
    CreateEntryView()
        .environment(AppManager.sample)
        .environment(JournalModel.sample)
}
