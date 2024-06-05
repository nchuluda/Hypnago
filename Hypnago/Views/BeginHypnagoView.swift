//
//  BeginHypnagoView.swift
//  FourFingerTouch
//
//  Created by Nathan on 5/22/24.
//

import SwiftUI

struct BeginHypnagoView: View {
    @Environment(AppManager.self) var appManager
    @State private var title = ""
    @State private var fingerCount: FingerCount = .four
    
    var body: some View {
        VStack {
            Text("New Session")
                .font(.system(.title, design: .serif))
                .fontWeight(.black)
            Form {
                
                Section(header: Text("Where will your mind go today?")) {
                    if self.title.isEmpty {
                        Text("PLEASE ENTER A TITLE")
                            .foregroundColor(.red)
                            .font(.caption)
                    }
                    TextField("Session Title", text: $title)
                }
                
                Section(header: Text("Select Finger Configuration:")) {
                    Picker("How would you like to hold your phone?", selection: $fingerCount) {
                        Text("One Finger").tag(FingerCount.one)
                        Text("Two Fingers").tag(FingerCount.two)
                        Text("Four Fingers").tag(FingerCount.four)
                    }
                    .pickerStyle(.inline)
                }
                Button("Submit", action: {
                    appManager.fingerCount = self.fingerCount
                    appManager.title = self.title
                    appManager.appState = .hypnagoSession
                })
                .disabled(self.title.isEmpty)
            }
        }
    }
}

#Preview {
    BeginHypnagoView()
        .environment(AppManager.sample)
}
