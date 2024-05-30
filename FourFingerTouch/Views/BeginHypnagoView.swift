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
    
    var body: some View {
        VStack {
            Text("Ready to Hypnago?")
                .font(.title.bold())
            Form {
                Section(header: Text("What is on your mind?")) {
                    TextField("Session Title", text: $title)
                }
                
                Button("Submit", action: {
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
