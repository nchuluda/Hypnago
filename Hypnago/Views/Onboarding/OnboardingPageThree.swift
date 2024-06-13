//
//  PageThree.swift
//  Hypnago
//
//  Created by Nathan on 6/11/24.
//

import SwiftUI

struct OnboardingPageThree: View {
//    @AppStorage("startOnBoarding") var startOnBoarding = true
    @Environment(AppManager.self) var appManager
    @AppStorage("onBoarding") private var startOnBoarding = true
    @Binding var currentPage: Int
    var body: some View {
        ZStack {
            Color.onboardingBackground
                .ignoresSafeArea()
                VStack {
                    Text("Using Hypnago")
                        .font(.system(.title, design: .serif))
                        .fontWeight(.black)

                       
//                    Text("\nWith Hypnago, you can effortlessly tap into the creative power of hypnagogia. Here’s how it works:\n")
//                        .font(.system(.body))
                    VStack(alignment: .leading, spacing: 10) {
                        InstructionStepView(stepNumber: 1, description: "Get Comfortable")
                            .bold()
//                            Text("Begin by finding a comfortable position and placing your fingers on your phone's screen however you see fit.")
                        Text("Find a comfortable position, preferably free from distractions .")
                        InstructionStepView(stepNumber: 2, description: "Start the Session")
                            .bold()
//                        Text("Hypnago detects when your fingers are in place. Relax and fall asleep!")
                        Text("While holding your fingers on the screen, relax and fall asleep!")
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
                    Spacer()
                    Button(action: {
                        startOnBoarding = false
                        appManager.appState = .history
                    }, label: {
                        Text(" Begin ")
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
                }
        }
    }
}

//#Preview {
//    PageThree(currentPage: .constant(3))
//}
