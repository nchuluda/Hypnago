//
//  RecordingView.swift
//  Hypnago
//
//  Created by Gabriel Push on 6/5/24.
//

import SwiftUI
import SwiftData

struct RecordingView: View {
    @ObservedObject var audio: AudioRecorder
    
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

    }
}

#Preview {
    RecordingView(audio: AudioRecorder())
}
