//
//  Journal.swift
//  FourFingerTouch
//
//  Created by Nathan on 5/20/24.
//

import Foundation

struct Entry: Identifiable, Equatable, Codable {
    var id = UUID()
    var title: String
    var date: Date
    var entry: String
  //  var recording: [URL]?
}
