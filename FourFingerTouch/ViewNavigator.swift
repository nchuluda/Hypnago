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

//    @ObservedObject var journalModel: JournalModel = JournalModel()
    
    var body: some View {
        switch appManager.appState {
        case .setup:
            BeginHypnagoView()
                .environment(appManager)
        case .hypnagoSession:
            HypnagoView()
                .environment(appManager)
        case .createEntry:
            CreateEntryView()
                .environment(appManager)
        case .history:
            JournalView()
                .environment(appManager)
                .environment(journalModel)
        }
    }
}

#Preview {
    ViewNavigator(appManager: AppManager.sample)
}
