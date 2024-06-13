//
//  InstructionStepView.swift
//  Hypnago
//
//  Created by Nathan on 6/11/24.
//

import SwiftUI

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

//#Preview {
//    InstructionStepView()
//}
