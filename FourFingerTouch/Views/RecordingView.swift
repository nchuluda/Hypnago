//
//  RecordingView.swift
//  FourFingerTouch
//
//  Created by Gabriel Push on 5/31/24.
//

import SwiftUI

struct RecordingView: View {
    
    @ObservedObject var audio = AudioRecorder()
    
    var body: some View {
       
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
        
        
        
    }
}

#Preview {
    RecordingView()
}
