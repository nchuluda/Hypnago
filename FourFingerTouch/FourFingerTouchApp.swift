//
//  FourFingerTouchApp.swift
//  FourFingerTouch
//
//  Created by Nathan on 5/14/24.
//

import SwiftUI

@main
struct FourFingerTouchApp: App {
    @State private var appManager = AppManager()
    @State var journalModel: JournalModel = JournalModel()

    var body: some Scene {
        WindowGroup {
//            ContentView()
//            JournalView()
            ViewNavigator(appManager: appManager)
                .environment(journalModel)
        }
    }
}
