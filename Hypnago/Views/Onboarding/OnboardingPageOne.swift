//
//  PageOne.swift
//  Hypnago
//
//  Created by Nathan on 6/11/24.
//

import SwiftUI

struct OnboardingPageOne: View {
    @Binding var currentPage: Int
    var body: some View {
        ZStack {
            Color.onboardingBackground
                .ignoresSafeArea()
            VStack{
                Spacer()
                Text("HYPNAGO")
                    .fontWeight(.black)
                    .foregroundColor(.onboardingText)
                    .font(.system(.largeTitle, design: .serif))
                    .padding()
                Spacer()
                Button(action: {
                    currentPage = 2
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
    }}

#Preview {
    OnboardingPageOne(currentPage: .constant(1))
}
