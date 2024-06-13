//
//  PageTwo.swift
//  Hypnago
//
//  Created by Nathan on 6/11/24.
//

import SwiftUI

struct OnboardingPageTwo: View {
    @Binding var currentPage: Int
    var body: some View {
        ZStack {
            Color.onboardingBackground
                .ignoresSafeArea()

//            ScrollView {
                VStack(alignment: .leading) {
                    Text("Welcome to Hypnago!")
                        .font(.system(.title, design: .serif))
                        .fontWeight(.black)
                        .padding()
                    VStack {
//                        Text("\n    Inspired by the mystical state of hypnagogia, Hypnago harnesses the mind’s transition from wakefulness to sleep to access subconscious creativity. Visionaries like Salvador Dali, Albert Einstein, and Thomas Edison tapped into hypnagogia for groundbreaking ideas. The app helps transform fleeting moments of insight into innovation and inspiration.\n\n    Hypnagogia, the transitional state between wakefulness and sleep, is known for vivid sensory experiences and enhanced creativity. It fosters a free flow of thoughts, often leading to creative ideas and insights. This state can enhance creativity and problem-solving abilities through spontaneous and surreal imagery or sensations.\n")
//                            .foregroundColor(.onboardingText)
//                            .font(.system(.title3))
//                            .padding()
                        Text("     Inspired by the mystical state of hypnagogia, Hypnago harnesses the mind’s transition from wakefulness to sleep to access subconscious creativity. Visionaries like Salvador Dali, Albert Einstein, and Thomas Edison tapped into hypnagogia for groundbreaking ideas. The app helps transform fleeting moments of insight into innovation and inspiration.")
                            .foregroundColor(.onboardingText)
                            .font(.system(.title3))
                            .padding()
                        Text("     Hypnagogia, the transitional state between wakefulness and sleep, is known for vivid sensory experiences and enhanced creativity. It fosters a free flow of thoughts, often leading to creative ideas and insights. This state can enhance creativity and problem-solving abilities through spontaneous and surreal imagery or sensations.")
                            .foregroundColor(.onboardingText)
                            .font(.system(.title3))
                            .padding()
                        Spacer()
                        Button(action: {
                            currentPage = 3
                        }, label: {
                            Text("Continue")
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
//            }
        }
    }
}

#Preview {
    OnboardingPageTwo(currentPage: .constant(2))
}
