//
//  CreateEntryView.swift
//  FourFingerTouch
//
//  Created by Nathan on 5/23/24.
//

import SwiftUI

struct SubmitEntryView: View {
    @Environment(AppManager.self) var appManager
    @Environment(JournalModel.self) var journalModel
    @Environment(\.modelContext) var modelContext
    @State var entry: String = ""
    @State var isShowing = false
    
    var body: some View {
        VStack {
            
            
            Text("Where did your mind go?")
                .font(.system(.title, design: .serif))
                .fontWeight(.black)
            Form {
                Section(header: Text("Record your new ideas here:")) {
                    TextEditor(text: $entry)
                        .frame(minHeight: 200)
                }
                
                Button("Record", action: {
                    isShowing = true
                })
                
                Button("Submit", action: {
                    appManager.entry = self.entry
                    if let title = appManager.title,
                       let entry = appManager.entry {
                        modelContext.insert(Entry(title: title, date: Date(), entry: entry))
                        //                        journalModel.storedJournals.append(Entry(title: title, date: Date(), entry: entry))
                        appManager.title = nil
                        appManager.entry = nil
                    }
                    appManager.appState = .history
                })
                //                Button("Do you want to record?", action: {
                //                    appManager.appState = .recording
                //                })
            }
            .sheet(isPresented: $isShowing, content: {
                RecordingView(audio: AudioRecorder())
                    .presentationDetents([.medium])
                
            })
        }
    }
}

#Preview {
    SubmitEntryView()
        .environment(AppManager.sample)
        .environment(JournalModel.sample)
}
