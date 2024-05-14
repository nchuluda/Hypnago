//
//  ContentView.swift
//  FourFingerTouch
//
//  Created by Nathan on 5/14/24.
//

import SwiftUI

struct ContentView: View {
    @State var locations: [TouchLocation] = []
    
    var body: some View {
        
        ZStack {
            VStack {
                Text("Fingers touching: \(locations.count)")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            ForEach(locations, id: \.self) { location in
                Circle()
                    .stroke(lineWidth: 4.0)
                    .fill(Color.green)
                    .frame(width: 80, height: 80)
                    .position(x: location.point.x, y: location.point.y)
            }
            MultiTouchView(locations: $locations)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
    }
}

#Preview {
    ContentView()
}
