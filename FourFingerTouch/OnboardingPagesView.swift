//
//  onBoarding.swift
//  FourFingerTouch
//
//  Created by Johndanial on 5/29/24.
//

import SwiftUI

struct PageOne: View {
    var body: some View {
        ZStack {
            Color.colorOnboardingBackground
                .ignoresSafeArea()
            VStack{
                Text("HYPNAGO")
                    .fontWeight(.black)
                    .foregroundColor(.colorOnboardingText)
                    .font(.system(.largeTitle, design: .serif))
            }
        }
    }}

struct PageTwo: View {
    var body: some View {
        ZStack {
            Color.colorOnboardingBackground
                .ignoresSafeArea()
            VStack {
                
                Text(" About hynagogia ")
                    .font(.system(.title, design: .serif))
                    .bold()
                    .padding(30)
                
                VStack{
                    Text("What is it? Well for one, THIS IS NOT HYPNOSIS. We can’t do that, we promise. However, we can’t promise on any of the wild things your own brain will make when doing this activity.")
                    
                        .foregroundColor(.colorOnboardingText)
                        .font(.system(.title, design: .serif))
                    Spacer()
                }
            }}
    }}

struct PageThree: View {
    
    @Binding var startOnBoarding: Bool
    
    var body: some View {
        ZStack {
            Color.colorOnboardingBackground
                .ignoresSafeArea()
            VStack {
                
                Text(" What you’ll do ")
                    .font(.system(.largeTitle, design: .serif))
                    .bold()
                    .padding(30)
                
                Text("This is an explanation of what users can expect to do with the hypnagogia activity. It will be more detailed than this. \n \nWe will also mention some creatives that have done this, you know for credibility.")
                
                    .foregroundColor(.colorOnboardingText)
                    .font(.system(.title, design: .serif))
                Spacer()
                
                Button("Continue") {
//                    startOnBoarding.toggle()
//                    print("ok")
                    appManager.appState = .setup
                    
                }
                .font(.largeTitle)
                .padding(70)
            }
        }
    }
}

#Preview {
    OnboardingView()
}
