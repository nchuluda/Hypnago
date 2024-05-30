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
    @ObservedObject var audio: AudioRecorder = AudioRecorder()
    

    
    var body: some View {
        VStack {
            List(self.audio.audios, id: \.self) { i in
                Text(i.formatted())
            }
            Button(action: {
                audio.startRecording()
                
            }, label: {
                Image(systemName: "mic.fill.badge.plus")
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(audio.recording ? .red : .green)
                    .frame(width: 70, height: 70)
            })
            ForEach(audio.audios, id: \.self) { audio in
                HStack {
                    Text(audio.lastPathComponent)
                    Spacer()
                    Button(action: {
                        self.audio.playAudio(audio: audio)
                    }) {
                        Image(systemName: "play.circle")
                    }
                }
            }
            
            Text(audio.recording ? "Recording..." : "Click to Record")
                .font(.caption)
                .bold()
                .foregroundColor(audio.recording ? .green : .red)
            
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
    CreateEntryView(audio: AudioRecorder())
        .environment(AppManager.sample)
        .environment(JournalModel.sample)
}
