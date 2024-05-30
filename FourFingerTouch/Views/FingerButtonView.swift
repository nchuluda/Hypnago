//
//  FingerButtonView.swift
//  FourFingerTouch
//
//  Created by Jackelyn Toral on 5/30/24.
//

import SwiftUI

struct FingerButtonView: View {
    var body: some View {
        ZStack {
            Circle()
              .foregroundColor(.clear)
              .frame(width: 114, height: 114)
              .background(
                AngularGradient(
                  stops: [
                    Gradient.Stop(color: Color(red: 0.8, green: 0.49, blue: 0.13), location: 0.15),
                    Gradient.Stop(color: Color(red: 0.79, green: 0.93, blue: 0.2), location: 0.34),
                    Gradient.Stop(color: Color(red: 0.38, green: 0.92, blue: 0.62), location: 0.50),
                    Gradient.Stop(color: Color(red: 0.04, green: 0.86, blue: 0.96), location: 0.66),
                    Gradient.Stop(color: Color(red: 0.44, green: 0.44, blue: 0.58), location: 0.83),
                    Gradient.Stop(color: Color(red: 0.76, green: 0.14, blue: 0.29), location: 1.00),
                  ],
                  center: UnitPoint(x: 0.5, y: 0.5),
                  angle: Angle(degrees: 90)
                )
              )
              .cornerRadius(114)
              .blur(radius: 20)
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 82, height: 82)
              .background(
                LinearGradient(
                  stops: [
                    Gradient.Stop(color: Color(red: 0, green: 1, blue: 0.94).opacity(0.2), location: 0.18),
                    Gradient.Stop(color: Color(red: 1, green: 0, blue: 0).opacity(0.2), location: 1.00),
                  ],
                  startPoint: UnitPoint(x: 0.76, y: 0),
                  endPoint: UnitPoint(x: 0.5, y: 1)
                )
              )
              .background(
                LinearGradient(
                  stops: [
                    Gradient.Stop(color: Color(red: 0.2, green: 1, blue: 0).opacity(0.5), location: 0.10),
                    Gradient.Stop(color: Color(red: 1, green: 0, blue: 0.76).opacity(0.5), location: 0.87),
                  ],
                  startPoint: UnitPoint(x: 0.15, y: 0.02),
                  endPoint: UnitPoint(x: 0.88, y: 1)
                )
              )
              .background(
                LinearGradient(
                  stops: [
                    Gradient.Stop(color: Color(red: 1, green: 0.54, blue: 0).opacity(0.5), location: 0.24),
                    Gradient.Stop(color: Color(red: 0.02, green: 0, blue: 1).opacity(0.5), location: 1.00),
                  ],
                  startPoint: UnitPoint(x: 0.12, y: 0.79),
                  endPoint: UnitPoint(x: 0.85, y: 0.26)
                )
              )
              .cornerRadius(41)
            Circle()
                .fill(Color("FingerColor"))
                .frame(width: 70)
         
        }
    }
}


#Preview {
    FingerButtonView()
}
