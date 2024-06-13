//
//  onBoarding.swift
//  FourFingerTouch
//
//  Created by Johndanial on 5/29/24.
//

import SwiftUI

struct OnboardingView: View {
    @Environment(AppManager.self) var appManager
    @AppStorage("onBoarding") private var startOnBoarding = true
    @State private var currentPage = 0
    private let totalPages = 3
    
    var body: some View {
        switch currentPage {
        case 1:
            OnboardingPageOne(currentPage: $currentPage)
        case 2:
            OnboardingPageTwo(currentPage: $currentPage)
        case 3:
            OnboardingPageThree(currentPage: $currentPage)
        default:
            OnboardingPageOne(currentPage: $currentPage)
        }
    }}

#Preview {
    OnboardingView()
        .environment(AppManager.sample)
}
