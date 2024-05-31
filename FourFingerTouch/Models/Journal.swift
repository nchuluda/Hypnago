//
//  Journal.swift
//  FourFingerTouch
//
//  Created by Nathan on 5/29/24.
//

import Foundation
import SwiftData

@Model
final class Journal {
    var entries: [Entry] = []
    
    init(entries: [Entry]) {
        self.entries = entries
    }
}

