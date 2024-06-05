//
//  Journal.swift
//  FourFingerTouch
//
//  Created by Nathan on 5/20/24.
//

import Foundation
import SwiftData

//struct Entry: Identifiable, Equatable, Codable {
//    var id = UUID()
//    var title: String
//    var date: Date
//    var entry: String
//  //  var recording: [URL]?
//}

@Model
final class Entry {
    var id = UUID()
    var title: String
    var date: Date
    var entry: String
//    var recording: [URL]?
    
    init(id: UUID = UUID(), title: String, date: Date, entry: String) {
        self.id = id
        self.title = title
        self.date = date
        self.entry = entry
    }
}
