//
//  ViewNavigator.swift
//  FourFingerTouch
//
//  Created by Nathan on 5/23/24.
//

import SwiftUI

struct ViewNavigator: View {
    @State var appManager: AppManager
//    @EnvironmentObject var journalModel: JournalModel
    @Environment(JournalModel.self) var journalModel
    @AppStorage("onBoarding") private var startOnBoarding = true
//    @ObservedObject var journalModel: JournalModel = JournalModel()
    
    var body: some View {
        switch appManager.appState {
        case .onboarding:
            if startOnBoarding {
            OnboardingView()
                    .environment(appManager)
            } else {
                BeginHypnagoView()
                    .environment(appManager)
            }
        case .setup:
            BeginHypnagoView()
                .environment(appManager)
        case .hypnagoSession:
            switch appManager.fingerCount {
            case .four:
                Hypnago4FingerView()
                    .environment(appManager)
            case .two:
                Hypnago2FingerView()
                    .environment(appManager)
            case .one:
                Hypnago1FingerView()
                    .environment(appManager)
            }
        case .createEntry:
            CreateEntryView()
                .environment(appManager)
                .environment(journalModel)
        case .history:
            JournalView()
                .environment(appManager)
                .environment(journalModel)
//        case .recording:
//            RecordingView()
//                .environment(appManager)
//                .environment(journalModel)
        }
    }
}

#Preview {
    ViewNavigator(appManager: AppManager.sample)
        .environment(JournalModel.sample)
}
