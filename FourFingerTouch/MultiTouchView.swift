//
//  MultiTouchView.swift
//  MultiTouchInstrument
//
//  Created by Zoe Cutler on 3/4/24.
//  Adapted by Nathan Chuluda on  5/14/24.
//

import SwiftUI

struct TouchLocation: Equatable, Hashable {
    var id = UUID()
    var point: CGPoint
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.point == rhs.point && lhs.id == rhs.id
    }
}

struct MultiTouchView: UIViewRepresentable {
    @Binding var locations: [TouchLocation]
    let view = UIView()
    
    func makeUIView(context: Context) -> UIView {
        let gesture = MyPanGestureRecognizer(target: context.coordinator, action: nil)
        gesture.betterDelegate = context.coordinator
        view.addGestureRecognizer(gesture)
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // idk
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MyPanGestureRecognizerDelegate {
        var parent: MultiTouchView
        
        init(_ parent: MultiTouchView) {
            self.parent = parent
        }
        
        func add(_ touches: Set<UITouch>) {
            if parent.locations.count >= 5 {
                parent.locations = touches.map { touch in
                    TouchLocation(point: touch.location(in: parent.view))
                }
            } else {
                parent.locations.append(contentsOf: touches.map { touch in
                    TouchLocation(point: touch.location(in: parent.view))
                })
            }
        }
        
        func update(_ touches: Set<UITouch>) {
            let touchesArray = Array(touches)
            parent.locations = parent.locations.map { location in
                if let touch = touchesArray.first(where: { $0.previousLocation(in: parent.view) == location.point }) {
                    TouchLocation(id: location.id, point: touch.location(in: parent.view))
                } else {
                    location
                }
            }
        }
        
        func remove(_ touches: Set<UITouch>) {
            parent.locations.removeAll { existingLocation in
                touches.contains { touchToRemove in
                    existingLocation.point == touchToRemove.location(in: parent.view)
                    || existingLocation.point == touchToRemove.previousLocation(in: parent.view)
                }
            }
        }
        
        func cancelAll() {
            parent.locations.removeAll()
        }
    }
}

class MyPanGestureRecognizer: UIPanGestureRecognizer {
    weak var betterDelegate: MyPanGestureRecognizerDelegate?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        betterDelegate?.add(touches)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        betterDelegate?.update(touches)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        betterDelegate?.remove(touches)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        betterDelegate?.cancelAll()
    }
}

protocol MyPanGestureRecognizerDelegate: UIGestureRecognizerDelegate {
    func add(_ touches: Set<UITouch>)
    func update(_ touches: Set<UITouch>)
    func remove(_ touches: Set<UITouch>)
    func cancelAll()
}

extension CGPoint: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}
