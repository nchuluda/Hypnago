//
//  Journal.swift
//  FourFingerTouch
//
//  Created by Nathan on 5/20/24.
//

import Foundation

struct Journal: Identifiable {
    var id = UUID()
    var name: String
    var date: Date
    var entry: String
}
