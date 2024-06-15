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
                        Gradient.Stop(color: Color(red: 0, green: 1, blue: 0.94).opacity(0.25), location: 0.18),
                        Gradient.Stop(color: Color(red: 0.97, green: 0.06, blue: 0.34).opacity(0.25), location: 1.00),
                    ],
                    startPoint: UnitPoint(x: 1, y: 0),
                    endPoint: UnitPoint(x: 0.03, y: 0.79)
                )
            )
            .background(
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 0.36, green: 1, blue: 0.14).opacity(0.35), location: 0.10),
                        Gradient.Stop(color: Color(red: 0.83, green: 0.1, blue: 0.9).opacity(0.35), location: 0.87),
                    ],
                    startPoint: UnitPoint(x: 0.07, y: 0.27),
                    endPoint: UnitPoint(x: 0.93, y: 0.96)
                )
            )
            .background(
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 0.92, green: 0.71, blue: 0.16).opacity(0.3), location: 0.24),
                        Gradient.Stop(color: Color(red: 0.32, green: 0.31, blue: 0.96).opacity(0.3), location: 1.00),
                    ],
                    startPoint: UnitPoint(x: 0.07, y: 0.88),
                    endPoint: UnitPoint(x: 0.87, y: 0.06)
                )
            )
    }
}

#Preview {
    GradientView()
}
