//
//  Sherbert.swift
//  FourFingerTouch
//
//  Created by Nathan on 5/28/24.
//

import SwiftUI

struct Sherbert: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [Color.teal.opacity(0.5), Color.clear]), startPoint: .bottom, endPoint: .top)
                )
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [Color.yellow.opacity(0.3), Color.clear]), startPoint: .leading, endPoint: .trailing)
                )
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.3), Color.clear]), startPoint: .trailing, endPoint: .leading)
                )
        }
        .frame(width: 300, height: 100)

    }
}

#Preview {
    Sherbert()
}
