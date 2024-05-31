//
//  onBoarding.swift
//  FourFingerTouch
//
//  Created by Johndanial on 5/29/24.
//

import SwiftUI

struct OnboardingView: View {
    
//    @AppStorage("onBoarding") private var startOnBoarding = true
    @Environment(AppManager.self) var appManager
    @AppStorage("onBoarding") private var startOnBoarding = true
    @State private var currentPage = 0
    private let totalPages = 3
    
    var body: some View {
        
//        if startOnBoarding {
            ZStack{
                VStack {
                    TabView(selection: $currentPage) {
                        PageOne()
                            .tag(0)
                        PageTwo()
                            .tag(1)
                        PageThree()
                        
                            .environment(appManager)
                            .tag(2)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                    .padding()
                }
            }
//        }
    }}

#Preview {
    OnboardingView()
}
