//
//  AppManager.swift
//  FourFingerTouch
//
//  Created by Nathan on 5/23/24.
//

import Foundation

@Observable
final class AppManager {
    var appState: AppState = .setup
    var title: String?
    var entry: String?
}

#if DEBUG
extension AppManager {
    static let sample = AppManager()
}
#endif
