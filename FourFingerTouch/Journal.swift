//
//  Journal.swift
//  FourFingerTouch
//
//  Created by Nathan on 5/20/24.
//

import Foundation

struct Journal: Identifiable, Equatable {
    var id = UUID()
    var title: String
    var date: Date
    var entry: String
}
