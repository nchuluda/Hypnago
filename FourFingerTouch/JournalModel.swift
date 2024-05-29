//
//  JournalViewModel.swift
//  FourFingerTouch
//
//  Created by Nathan on 5/20/24.
//

import SwiftUI

@Observable
class JournalModel {
    var currentWeek: [Date] = []
    var nextWeek : [Date] = []
    var previousWeek : [Date] = []
    
    var currentDate: Date = Date()
    var viewingDate: Date = Date()
    
    var filteredJournals: [Journal]?
    
    var storedJournals: [Journal] = [
        Journal(title: "Marketing Campaign", date: Date(), entry: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. In metus vulputate eu scelerisque felis imperdiet proin fermentum leo."),
        Journal(title: "Dinner Party Recipes", date: Date(), entry: "Tristique magna sit amet purus gravida quis blandit. Tincidunt augue interdum velit euismod in pellentesque. Porttitor rhoncus dolor purus non enim praesent elementum facilisis leo."),
        Journal(title: "DJ Set", date: Calendar.current.date(byAdding: .day, value: 1, to: Date())!, entry: "Sit amet consectetur adipiscing elit pellentesque habitant morbi tristique. Netus et malesuada fames ac turpis egestas maecenas. Consequat id porta nibh venenatis."),
        Journal(title: "Halloween Costumes", date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, entry: "Donec pretium vulputate sapien nec. Quam quisque id diam vel quam elementum. Aliquam faucibus purus in massa tempor nec feugiat nisl."),
        Journal(title: "Theme Song", date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, entry: "Ut porttitor leo a diam sollicitudin. Odio ut enim blandit volutpat maecenas volutpat blandit aliquam. Ornare suspendisse sed nisi lacus sed viverra."),
        Journal(title: "Fashion Design", date: Calendar.current.date(byAdding: .day, value: 2, to: Date())!, entry: "Vestibulum rhoncus est pellentesque elit ullamcorper dignissim cras. Hendrerit gravida rutrum quisque non tellus orci ac. Ultrices dui sapien eget mi proin."),
        Journal(title: "Birthday Party Theme", date: Calendar.current.date(byAdding: .day, value: 3, to: Date())!, entry: "Lectus nulla at volutpat diam ut venenatis tellus. In hendrerit gravida rutrum quisque non tellus. Non pulvinar neque laoreet suspendisse interdum consectetur."),
        Journal(title: "App Development", date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!, entry: "Sagittis nisl rhoncus mattis rhoncus urna neque viverra. Diam quam nulla porttitor massa. Eget dolor morbi non arcu risus quis varius quam.")
    ]
    
    var completedSessions: Int {
        storedJournals.count
    }
    
    init() {
        fetchCurrentWeek()
        fetchPreviousNextWeek()
        filterTodayJournals()
    }
    
    func filterTodayJournals() {
        DispatchQueue.global(qos: .userInteractive).async {
            let calendar = Calendar.current
            
            let filtered = self.storedJournals.filter {
                return calendar.isDate($0.date, inSameDayAs: self.currentDate)
            }
            
            DispatchQueue.main.async {
                withAnimation {
                    self.filteredJournals = filtered
                }
            }
        }
    }
    
    func dayHasEntries(day: Date) -> Bool {
            let calendar = Calendar.current
            
            let filtered = self.storedJournals.filter {
                calendar.isDate($0.date, inSameDayAs: day)
            }
            
            return filtered.isEmpty ? false : true
    }
    
    func fetchCurrentWeek() {
        let today = Date()
        let calendar = Calendar.current
        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        
        guard let firstWeekDay = week?.start else {
            return
        }
        
        (1...7).forEach { day in
            
            if let weekday = calendar.date(byAdding: .day, value: day, to: firstWeekDay) {
                currentWeek.append(weekday)
            }
        }
    }
    
    func fetchPreviousNextWeek(){
        nextWeek.removeAll()
        let nextWeekToday = Calendar.current.date(byAdding: .day, value: 7, to: viewingDate )!
        
        var calendar = Calendar(identifier: .gregorian)
        calendar.firstWeekday = 7
        
        let startOfWeekNext = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: nextWeekToday))!
        
        (1...7).forEach{ day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: startOfWeekNext){
                nextWeek.append(weekday)
            }
        }
        
        previousWeek.removeAll()
        let previousWeekToday = Calendar.current.date(byAdding: .day, value: -7, to: viewingDate)!
        
        let startOfWeekPrev = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: previousWeekToday))!
        
        (1...7).forEach{ day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: startOfWeekPrev){
                previousWeek.append(weekday)
            }
        }
    }
    
    func extractDate(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
    
    func isToday(date: Date) -> Bool {
        let calendar = Calendar.current
        
        return calendar.isDate(currentDate, inSameDayAs: date)
    }
}

extension Date {
    var month: String {
        let names = Calendar.current.monthSymbols
        let month = Calendar.current.component(.month, from: self)
        return names[month - 1]
    }
}

//#if DEBUG
extension JournalModel {
    static let sample = JournalModel()
}
//#endif
