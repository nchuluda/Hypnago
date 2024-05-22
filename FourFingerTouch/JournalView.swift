//
//  JournalView.swift
//  FourFingerTouch
//
//  Created by Nathan on 5/20/24.
//

import SwiftUI

struct JournalView: View {
    @StateObject var journalModel: JournalModel = JournalModel()
    @Namespace var animation
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            HeaderView()
            
            // MONTH
            Text("\(journalModel.currentDate.month)")
                .font(.title3.bold())
            
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 1) {
                    Button {
                        print("Previous Week")
                        journalModel.currentWeek = journalModel.previousWeek
                        journalModel.viewingDate = Calendar.current.date(byAdding: .day, value: -7, to: journalModel.viewingDate)!
                        journalModel.fetchPreviousNextWeek()
                    } label: {
                        Label("", systemImage: "chevron.left")
                    }
                    ForEach(journalModel.currentWeek, id: \.self) { day in
                        VStack(spacing: 10) {
                            
                            // dd will return day as 01, 02, 03 ... etc
                            
                            #warning("Font sizes are not dynamic")
                            Text(journalModel.extractDate(date: day, format: "dd"))
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
//                                .foregroundStyle(.white)
                               
                                
                            
                            // EEE will return day as MON, TUE, WED ... etc
                            Text(journalModel.extractDate(date: day, format: "EEE"))
                                .font(.system(size: 14))
//                                .foregroundStyle(.white)
                            
                            Circle()
                                .fill(.white)
                                .frame(width: 8, height: 8)
                                .opacity(journalModel.isToday(date: day) ? 1 : 0)
                            
                        }
                        .foregroundStyle(journalModel.isToday(date: day) ? .primary : .secondary )
                        .foregroundColor(journalModel.isToday(date: day) ? .white : .black)
                        .frame(width: 45, height: 90)
                        .background(
                            ZStack {
                                if journalModel.isToday(date: day) {
                                    Capsule()
                                        .fill(.black)
                                        .matchedGeometryEffect(id: "CURRENTDAY", in: animation)
                                }
                            }
                        )
                        .contentShape(Capsule())
                        .onTapGesture {
                            // Updating Current Day
                            withAnimation {
                                journalModel.currentDate = day
                            }
                        }
                    }
                    Button {
                        print("Next Week")
                        journalModel.currentWeek = journalModel.nextWeek
                        journalModel.viewingDate = Calendar.current.date(byAdding: .day, value: 7, to: journalModel.viewingDate)!
                        journalModel.fetchPreviousNextWeek()
                    } label: {
                        Label("", systemImage: "chevron.right")
                    }
                }
                .padding(.horizontal)
            }
            JournalsView()
        }
        .ignoresSafeArea(.container, edges: .top)
    }
    
    func JournalsView() -> some View {
        LazyVStack(spacing: 18) {
            if let journals = journalModel.filteredJournals {
                
                if journals.isEmpty {
                    Text("No entries found.")
                        .font(.system(size: 16))
                        .fontWeight(.light)
                        .offset(y: 100)
                } else {
                    ForEach(journals) { journal in
                        JournalCardView(journal: journal)
                    }
                }
                
            } else {
                // MARK: Progress View
                // ProgressView()
            }
        }
        
        // MARK: Updating Tasks
        .onChange(of: journalModel.currentDate) {
            journalModel.filterTodayJournals()
        }
    }
    
    func JournalCardView(journal: Journal) -> some View {
         
        HStack {
//            VStack(spacing: 10) {
//                Circle()
//                    .fill(.black)
//                    .frame(width: 15, height: 15)
//                    .background(
//                        Circle()
//                            .stroke(.black, lineWidth: 1)
//                            .padding(-3)
//                    )
//
//                Rectangle()
//                    .fill(.black)
//                    .frame(width: 3)
//            }
            
            VStack {
                HStack(alignment: .top, spacing: 10) {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Text(journal.name)
                                .font(.title2.bold())
                            Spacer()
                            Text(journal.date.formatted(date: .omitted, time: .shortened))
                        }
                        
                        Text(journal.entry)
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                    
                    HStack(spacing: 0) {
                        
                    }
                }
            }
            .padding(20)
//            .foregroundColor(.white)
//            .padding()
//            .background(
//                Color("Black")
//                    .cornerRadius(25)
//            )
        }
        
        
        
//        HStack(alignment: .top, spacing: 30) {
//            VStack(spacing: 10) {
//                VStack {
//                    HStack(alignment: .top, spacing: 10) {
//                        VStack(alignment: .leading, spacing: 12) {
//                            Text(journal.name)
//                                .font(.title2.bold())
//
//                            Text(journal.entry)
//                                .font(.callout)
//                                .foregroundStyle(.secondary)
//                        }
//                    }
//                }
//            }
//            .padding(20)
//        }
    }
    
    func HeaderView() -> some View {
        HStack(spacing: 10) {
            Text("Hypnago Entries")
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        }
        .padding()
        .padding(.top, getSafeArea().top)
        .background(Color.white)
    }
}

extension View {
    func hLeading() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func hTrailing() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    func hCenter() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .center)
    }
    
    func getSafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        
        return safeArea
    }
}

#Preview {
    JournalView()
}
