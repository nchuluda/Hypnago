//
//  FourFingerTouchApp.swift
//  FourFingerTouch
//
//  Created by Nathan on 5/14/24.
//

import SwiftUI
import SwiftData

@main
struct HypnagoApp: App {
    @State private var appManager = AppManager()
    @State var journalModel: JournalModel = JournalModel()
    @State var audioModel: AudioRecorder = AudioRecorder()

    var body: some Scene {
        WindowGroup {
//            ContentView()
//            JournalView()
            ViewNavigator(appManager: appManager)
                .environment(journalModel)
                .modelContainer(for: Entry.self)
//            ContentView(audio: AudioRecorder())
        //    JournalView()

        }
    }
}
