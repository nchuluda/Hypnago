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
            }
        }
    }}

struct PageTwo: View {
    var body: some View {
        ZStack {
            Color.onboardingBackground
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading) {
                    Text("About Hypnago")
                        .font(.system(.title, design: .serif))
                        .fontWeight(.black)
                    VStack{
                        Text("\nInspired by the mystical state of hypnagogia, Hypnago was created to harness the creative power of the mind’s transition from wakefulness to sleep. Just as visionaries like Salvador Dali, Albert Einstein, and Thomas Edison tapped into this state to unlock groundbreaking ideas, Hypnago guides you to access your own subconscious creativity. Discover how this app can transform fleeting moments of insight into a wellspring of innovation and inspiration.\n\nHypnagogia is the transitional state between wakefulness and sleep, known for vivid sensory experiences and enhanced creativity. Famous figures like Salvador Dali, Albert Einstein, and Thomas Edison harnessed this state to unlock innovative ideas. Dali and Edison used techniques to capture the unique visions and insights from hypnagogia, fueling their creative and inventive processes.\n\nDuring hypnagogia, a person experiences a transition from wakefulness to sleep, marked by vivid sensory phenomena, including visual, auditory, and tactile hallucinations. This state fosters a free flow of thoughts, often leading to creative ideas and insights. Muscle relaxation occurs, and the mind drifts, allowing spontaneous and often surreal imagery or sensations. This unique mental state can enhance creativity and problem-solving abilities.\n")
                            .foregroundColor(.onboardingText)
                            .font(.system(.body))
                    }
                }
            }
        }
    }
}

struct InstructionStepView: View {
    var stepNumber: Int
    var description: String
    var body: some View {
        HStack(alignment: .top) {
            Text("\(stepNumber).")
                .font(.system(.body, design: .serif))
                .fontWeight(.black)
            Text(description)
                .font(.body)
        }
    }
}

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
                    Text("\nWith Hypnago, you can effortlessly tap into the creative power of hypnagogia. Here’s how it works:\n")
                        .font(.system(.body))
                    VStack(alignment: .leading, spacing: 10) {
                        InstructionStepView(stepNumber: 1, description: "Get Comfortable: Begin by finding a comfortable position and placing your fingers on your phone's screen.")
                        InstructionStepView(stepNumber: 2, description: "Start the Session: Hypnago detects when your fingers are in place and initiates a countdown timer.")
                        InstructionStepView(stepNumber: 3, description: "Drift into Hypnagogia: As you relax, let your mind drift into the hypnagogic state. When your fingers naturally let go, the countdown will begin.")
                        InstructionStepView(stepNumber: 4, description: "Capture Your Insights: At the end of the countdown, an alarm will gently wake you. Use this moment to write down any vivid images, thoughts, or sensations you experienced.")
                        InstructionStepView(stepNumber: 5, description: "Review and Reflect: Over time, review your entries to uncover patterns and insights from your subconscious mind.")
                    }
                    Text("\nHypnago guides you through this unique cycle, helping you harness the fleeting moments of hypnagogia for enhanced creativity and self-discovery.")
                        .font(.body)
                }
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
                .padding(.top, getSafeArea().top)
                Text("\n")
                    .foregroundColor(.onboardingText)
                    .font(.system(.body))
            }
        }
    }
}

#Preview {
    OnboardingView()
        .environment(AppManager.sample)
}
