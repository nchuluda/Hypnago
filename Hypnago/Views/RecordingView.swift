//
//  RecordingView.swift
//  FourFingerTouch
//
//  Created by Gabriel Push on 5/31/24.
//

import SwiftUI

struct RecordingView: View {
    
    @ObservedObject var audio = AudioRecorder()
    @Environment(AppManager.self) var appManager

    
    var body: some View {
       
        
        Button(action: {
            audio.startRecording()
            
        }, label: {
            Image(systemName: "mic.fill.badge.plus")
                .resizable()
                .scaledToFill()
                .foregroundColor(audio.recording ? .red : .green)
                .frame(width: 70, height: 70)
        })
        
        Text(audio.recording ? "Recording..." : "Click to Record")
            .font(.caption)
            .bold()
            .foregroundColor(audio.recording ? .green : .red)
            .padding()
        
        Button("Submit", action: {
            appManager.appState = .history
        })
        .padding()
        
    }
}

#Preview {
    RecordingView()
}
