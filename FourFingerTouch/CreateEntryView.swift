//
//  CreateEntryView.swift
//  FourFingerTouch
//
//  Created by Nathan on 5/23/24.
//

import SwiftUI

struct CreateEntryView: View {
    @Environment(AppManager.self) var appManager
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
                    appManager.appState = .history
                })
            }
        }
    }
}

#Preview {
    CreateEntryView()
        .environment(AppManager.sample)
}
