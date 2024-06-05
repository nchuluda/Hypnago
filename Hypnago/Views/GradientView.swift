//
//  GradientView.swift
//  FourFingerTouch
//
//  Created by Jackelyn Toral on 5/29/24.
//

import SwiftUI

struct GradientView: View {
    var body: some View {
        CardGradient()
    }
}

func CardGradient() -> some View {
    ZStack {
        Rectangle()
            .fill(Color(.white))
        Rectangle()
          .foregroundColor(.clear)
          .background(
            LinearGradient(
                stops: [
                Gradient.Stop(color: Color(red: 1, green: 0.75, blue: 0.87), location: 0.00),
                Gradient.Stop(color: Color(red: 0.99, green: 0.89, blue: 0.94).opacity(0.76), location: 0.71),
                Gradient.Stop(color: .white.opacity(0.5), location: 1.00),
                ],
              startPoint: UnitPoint(x: 0.58, y: 0.03),
              endPoint: UnitPoint(x: 0.58, y: 1)
            )
          )
        Rectangle()
          .foregroundColor(.clear)
          .background(
            LinearGradient(
                stops: [
                Gradient.Stop(color: Color(red: 0.42, green: 0.84, blue: 0.87).opacity(0.5), location: 0.36),
                Gradient.Stop(color: Color(red: 0.8, green: 0.94, blue: 0.95).opacity(0.37), location: 0.67),
                Gradient.Stop(color: .white.opacity(0.25), location: 1.00),
                ],
              startPoint: .bottomLeading,
              endPoint: .topTrailing
            )
          )
        Rectangle()
          .foregroundColor(.clear)
          .background(
            LinearGradient(
                stops: [
                Gradient.Stop(color: Color(red: 0.9, green: 0.88, blue: 0.21).opacity(0.5), location: 0.00),
                Gradient.Stop(color: Color(red: 0.94, green: 0.92, blue: 0.49).opacity(0.41), location: 0.43),
                Gradient.Stop(color: .white.opacity(0.25), location: 1.00),
                ],
              startPoint: .bottomTrailing,
              endPoint: .topLeading)
            )
    }
}

#Preview {
    GradientView()
}
