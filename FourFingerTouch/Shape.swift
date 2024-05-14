//
//  Shape.swift
//  FourFingerTouch
//
//  Created by Nathan on 5/14/24.
//

//import Foundation
//import SwiftUI
//
//struct MyShape: Shape {
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        path.move(to: CGPoint(x: 20, y: 0))
//
//        for x in 0..<100 {
//            let point: CGPoint = simpleLine(x: Double(x))
//            path.addLine(to: point)
//        }
//
//        path.closeSubpath()
//        return path
//    }
//
//    func simpleLine(x: Double) -> CGPoint {
//        var y: Double = log(x + 1)
//        return CGPoint(x: x, y: y)
//    }
//
//}
