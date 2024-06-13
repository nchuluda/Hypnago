//
//  ContentView.swift
//  FourFingerTouch
//
//  Created by Nathan on 5/14/24.
//

import SwiftUI
import AVFoundation

struct Hypnago4FingerView: View {
    @Environment(AppManager.self) var appManager
    @State var locations: [TouchLocation] = []
//    @State var showTimer: Bool = false
    @State var timerValue = 10
    @State var timerInitialized = false
    @State var timerExpired = false
    @State var backgroundColor = Color.white
    @State var showingAlert = false
    @State private var audioPlayer: AVAudioPlayer?
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init() {
        if let soundURL = Bundle.main.url(forResource: "ringLikeClock", withExtension: "mp3") {
            do {
                _audioPlayer = State(initialValue: try AVAudioPlayer(contentsOf: soundURL)) // Initialize in State
                audioPlayer?.numberOfLoops = -1
                audioPlayer?.prepareToPlay()
            } catch {
                print("Error loading sound file: \(error.localizedDescription)")
            }
        }
    }
    
    var body: some View {
        ZStack {
//            backgroundColor
//                .ignoresSafeArea()
            VStack {
                Text("(\(locations.count)/4)")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding()
                Text("Place four fingers on screen to activate")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                
                if timerInitialized {
                    if locations.count < 4 {
                        Text("Timer: \(timerValue)")
                            .onReceive(timer) { _ in
                                if timerValue > 0 {
                                    timerValue -= 1
                                } else {
                                    timerValue = 0
                                }
                            }
                    } else {
                        Text("Timer: \(timerValue)")
                    }
                }
            }
 
            ForEach(locations, id: \.self) { location in
                FingerButtonView()
                    .position(x: location.point.x, y: location.point.y)
            }
            
            MultiTouchView(locations: $locations)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
        }
        .onChange(of: locations.count) {
            if locations.count == 4 {
                self.timerInitialized = true
                self.timerValue = 10
                
            }
        }
        .onChange(of: timerValue) {
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
            if timerValue == 0 {
                self.audioPlayer?.play()
                showingAlert = true
                self.timerExpired = true
                
//                backgroundColor = Color.red
                
            }
        }
        .alert("Wake up and journal!", isPresented: $showingAlert) {
            Button("OK", role: .cancel) {
                appManager.appState = .createEntry
            }
        }
    }
}

#Preview {
    Hypnago4FingerView()
        .environment(AppManager.sample)
}
