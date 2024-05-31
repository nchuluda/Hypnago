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
            Text("Ready to Hypnago?")
                .font(.title.bold())
            Form {
                
                Section(header: Text("What is on your mind?")) {
                    if self.title.isEmpty {
                        Text("Please enter a title")
                            .foregroundColor(.red)
                    }
                    TextField("Session Title", text: $title)
                }
                
                Section(header: Text("How many fingers would you like to use?")) {
                    Picker("How would you like to hold your phone?", selection: $fingerCount) {
                        Text("One Finger").tag(FingerCount.one)
                        Text("Two Fingers").tag(FingerCount.two)
                        Text("Four Fingers").tag(FingerCount.four)
                    }
                    .pickerStyle(.segmented)
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
