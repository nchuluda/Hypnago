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
            Color.onboardingBackground
                .ignoresSafeArea()
            VStack{
                Text("HYPNAGO")
                    .fontWeight(.black)
                    .foregroundColor(.onboardingText)
                    .font(.system(.largeTitle, design: .serif))
                    .padding()
            }
        }
    }}

struct PageTwo: View {
    var body: some View {
        ZStack {
            Color.onboardingBackground
                .ignoresSafeArea()
<<<<<<< Updated upstream
            VStack {
                
                Text(" About hynagogia ")
                    .font(.system(.title, design: .serif))
                    .bold()
                    .padding(30)
                
                VStack{
                    Text("What is it? Well for one, THIS IS NOT HYPNOSIS. We can’t do that, we promise. However, we can’t promise on any of the wild things your own brain will make when doing this activity.")
                    
                        .foregroundColor(.onboardingText)
                        .font(.system(.title, design: .serif))
                    Spacer()
=======
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Welcome to Hypnago!")
                        .font(.system(.title, design: .serif))
                        .fontWeight(.black)
                        .padding()
                    VStack{
                        Text("\n    Inspired by the mystical state of hypnagogia, Hypnago harnesses the mind’s transition from wakefulness to sleep to access subconscious creativity. Visionaries like Salvador Dali, Albert Einstein, and Thomas Edison tapped into hypnagogia for groundbreaking ideas. The app helps transform fleeting moments of insight into innovation and inspiration.\n\n    Hypnagogia, the transitional state between wakefulness and sleep, is known for vivid sensory experiences and enhanced creativity. It fosters a free flow of thoughts, often leading to creative ideas and insights. This state can enhance creativity and problem-solving abilities through spontaneous and surreal imagery or sensations.\n")
                            .foregroundColor(.onboardingText)
                            .font(.system(.title3))
                            .padding()
                    }
>>>>>>> Stashed changes
                }
            }}
    }}

struct PageThree: View {
//    @AppStorage("startOnBoarding") var startOnBoarding = true
    @Environment(AppManager.self) var appManager
    @AppStorage("onBoarding") private var startOnBoarding = true
    var body: some View {
        ZStack {
            Color.onboardingBackground
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Using Hypnago to Explore Hypnagogia")
                        .font(.system(.title, design: .serif))
                        .fontWeight(.black)
                       
//                    Text("\nWith Hypnago, you can effortlessly tap into the creative power of hypnagogia. Here’s how it works:\n")
//                        .font(.system(.body))
                    VStack(alignment: .leading, spacing: 10) {
                        InstructionStepView(stepNumber: 1, description: "Get Comfortable")
                            .bold()
                            Text("Begin by finding a comfortable position and placing your fingers on your phone's screen however you see fit.")
                        InstructionStepView(stepNumber: 2, description: "Start the Session")
                            .bold()
                        Text("Hypnago detects when your fingers are in place. Relax and fall asleep!")
                        InstructionStepView(stepNumber: 3, description: "Drift into Hypnagogia")
                            .bold()
                        Text("Let your mind drift into the hypnagogic state. When your fingers naturally let go, the countdown will begin.")
                        InstructionStepView(stepNumber: 4, description: "Capture Your Insights")
                            .bold()
                        Text("At the end of the countdown, an alarm will gently wake you. Use this moment to write down any vivid images, thoughts, or sensations you experienced.")
                        InstructionStepView(stepNumber: 5, description: "Review and Reflect")
                            .bold()
                        Text("Use our calendar to review your entries, uncovering patterns and insights from your subconscious mind.")
                    }
                    .padding()
                    
//                    Text("\nHypnago guides you through this unique cycle, helping you harness the fleeting moments of hypnagogia for enhanced creativity and self-discovery.")
                      //  .font(.body)
                }
                .padding()
                Button(action: {
                    startOnBoarding = false
                    appManager.appState = .setup
                }, label: {
                    Text("Begin")
                        .font(.system(.title3, design: .serif))
                        .fontWeight(.black)
                        .foregroundColor(.onboardingText)
                        .padding()
                        .background(Color.onboardingBackground)
                        .cornerRadius(47)
                        .overlay(
                            RoundedRectangle(cornerRadius: 47)
                                .stroke(Color.onboardingText, lineWidth: 2)
                        )})
             //   .padding()
                Text("\n")
                    .foregroundColor(.onboardingText)
                    .font(.system(.body))
            }
        }
    }
}

#Preview {
    OnboardingView()
}
