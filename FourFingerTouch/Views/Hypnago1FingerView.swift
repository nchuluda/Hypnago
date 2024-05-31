//
//  Hypnago1FingerView.swift
//  FourFingerTouch
//
//  Created by Nathan on 5/29/24.
//

import SwiftUI

struct Hypnago1FingerView: View {
    @Environment(AppManager.self) var appManager
    @State var locations: [TouchLocation] = []
//    @State var showTimer: Bool = false
    @State var timerValue = 10
    @State var timerInitialized = false
    @State var timerExpired = false
    @State var backgroundColor = Color.white
    @State var showingAlert = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
//            backgroundColor
//                .ignoresSafeArea()
            VStack {
                Text("(\(locations.count)/1)")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding()
                Text("Place one finger on screen to activate")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                if timerInitialized {
                    if locations.count < 1 {
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
            
//            if timerExpired {
//                Button("Reset") {
//                    timerValue = 10
//                    timerInitialized = false
//                    timerExpired = false
//                    backgroundColor = Color.white
//                }
//                .buttonStyle(.borderedProminent)
//                .offset(y: 200)
//
//            }
        }
        .onChange(of: locations.count) {
            if locations.count == 1 {
                self.timerInitialized = true
                self.timerValue = 10
                
            }
        }
        .onChange(of: timerValue) {
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
            if timerValue == 0 {
                showingAlert = true
                self.timerExpired = true
                backgroundColor = Color.red
                
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
    Hypnago1FingerView()
        .environment(AppManager.sample)
}
