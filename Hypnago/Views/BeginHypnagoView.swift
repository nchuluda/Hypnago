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
                .frame(maxWidth: .infinity)
                .overlay(alignment: .trailing) {
                    Button {
                        appManager.appState = .history
                    } label: {
                        Image(systemName: "xmark.circle")
                            .font(.title)
                            .foregroundColor(Color("BackgroundColor"))
                            .background(Color("TextColor"))
                            .clipShape(.circle)
                    }
                    .padding(.horizontal, 25)
                }
                
            
            Form {
                
                Section(header: Text("Where will your mind go today?")) {
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
