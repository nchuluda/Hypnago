//
//  JournalView.swift
//  FourFingerTouch
//
//  Created by Nathan on 5/20/24.
//

import SwiftUI
import SwiftData

struct JournalView: View {
    @Environment(AppManager.self) var appManager
    @Environment(JournalModel.self) var journalModel
//    @Environment(\.modelContext) var modelContext
    @Namespace var animation
//    @ObservedObject var audio = AudioRecorder()
    @Query var entries: [Entry]
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ZStack {
                    VStack(alignment: .center) {
                        
                        // MONTH HEADER
                        HStack {
                            Group {
                                Text("\(journalModel.viewingDate.month)")
                                    .font(.system(.title, design: .serif))
                                    .frame(maxWidth: .infinity)
                                    .fontWeight(.black)
                                    .overlay(alignment: .trailing) {
                                        NavigationLink(destination: InstructionsView()) {
                                                Image(systemName: "questionmark.circle")
                                                    .font(.title)
                                                    .foregroundColor(Color("BackgroundColor"))
                                                    .background(Color("TextColor"))
                                                    .clipShape(.circle)
                                        }
                                        
                                        .padding(.horizontal, 25)
                                    }
                            }
                            .padding(.top, getSafeArea().top)
                            
                        }
                        
                        // CALENDAR
                        HStack(spacing: 1) {
                            Button {
                                journalModel.switchToPreviousWeek()
                            } label: {
                                Label("", systemImage: "chevron.left")
                            }
                            .font(.system(size: 20))
                            
                            ForEach(journalModel.currentWeek, id: \.self) { day in
                                VStack(spacing: 10) {
                                    
                                    // dd will return day as 01, 02, 03 ... etc
#warning("Font sizes are not dynamic")
                                    Text(journalModel.extractDate(date: day, format: "dd"))
                                        .font(.system(size: 15))
                                        .fontWeight(.semibold)
                                        .foregroundStyle(journalModel.isToday(date: day) ? Color("BackgroundColor") : Color("TextColor"))
                                    
                                    // EEE will return day as MON, TUE, WED ... etc
                                    Text(journalModel.extractDate(date: day, format: "EEE"))
                                        .font(.system(size: 14))
                                        .foregroundStyle(journalModel.isToday(date: day) ? Color("BackgroundColor") : Color("TextColor"))
                                    
                                    ZStack {
                                        // Blue circle if day has entries
                                        Circle()
                                            .fill(.blue)
                                            .frame(width: 8, height: 8)
                                            .opacity(journalModel.dayHasEntries(day: day) ? 1 : 0)
                                        // White circle for selected day
                                        Circle()
                                            .fill(journalModel.isToday(date: day) ? Color("BackgroundColor") : Color("TextColor"))
                                            .frame(width: 8, height: 8)
                                            .opacity(journalModel.isToday(date: day) ? 1 : 0)
                                    }
                                }
                                .foregroundStyle(journalModel.isToday(date: day) ? .primary : .secondary )
                                .foregroundColor(journalModel.isToday(date: day) ? .white : .black)
                                .frame(width: 45, height: 90)
                                .background(
                                    ZStack {
                                        if journalModel.isToday(date: day) {
                                            Capsule()
                                                .fill(Color("TextColor"))
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
                                journalModel.switchToNextWeek()
                                
                            } label: {
                                Label("", systemImage: "chevron.right")
                            }
                            .font(.system(size: 20))
                        }
                        .padding(.horizontal)
                        
                        SessionsCompletedView(width: geo.size.width * 0.9)
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            JournalsView()
                        }
                    }
                    .ignoresSafeArea(.container, edges: .top)
                }
            }
        }
        .onAppear(perform:  {
            journalModel.storedJournals = entries
        })
    }
    
    func JournalsView() -> some View {
        LazyVStack(spacing: 18) {
            if let journals = journalModel.filteredJournals {
                
                if journals.isEmpty {
                    Text("No entries found.")
                        .font(.system(.headline, design: .serif))
                        .fontWeight(.bold)
                        .offset(y: 100)
                } else {
                    ForEach(journals) { journal in
                        JournalCardView(journal: journal)
                    }
//                    List(self.audio.audios, id: \.self) { i in
//                        Text(i.formatted())
//                    }
                    
//                    ForEach(audio.audios, id: \.self) { audio in
//                        HStack {
//                            Text(audio.lastPathComponent)
//                            Spacer()
//                            Button(action: {
//                                self.audio.playAudio(audio: audio)
//                            }) {
//                                Image(systemName: "play.circle")
//                            }
//                        }
//                    }
                }
            }
        }
        
        // MARK: Updating Tasks
        .onChange(of: journalModel.currentDate) {
            journalModel.filterTodayJournals()
        }
        .task {
            journalModel.filterTodayJournals()
        }
    }
    
    func JournalCardView(journal: Entry) -> some View {
        HStack {
            VStack {
                HStack(alignment: .top, spacing: 10) {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Text(journal.title)
                                .font(.system(.title3, design: .serif))
                                .fontWeight(.black)
                                .lineLimit(1)
                            
                            Spacer()
                            Text(journal.date.formatted(date: .omitted, time: .shortened))
                        }
                        Text(journal.entry)
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    
                    }
                }
            }
            .padding(20)
        }
    }
    
    func HeaderView() -> some View {
        HStack(spacing: 10) {
            Text("Hypnago Entries")
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        }
        .padding()
        .padding(.top, getSafeArea().top)
        .background(Color("backgroundColor"))
    }
    
    func NewEntryButton() -> some View {
        Button(action: {
            appManager.appState = .setup
        }) {
            ZStack {
                Circle()
                    .frame(width: 53, height: 53)
                    .foregroundColor(Color("BackgroundColor"))
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color("TextColor"))
                Image(systemName: "plus")
                    .foregroundColor(Color("BackgroundColor"))
//                    .imageScale(.large)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
//                    .frame(width: 50, height: 50)
            }
        }
    }
    
    func SessionsCompletedView(width: CGFloat) -> some View {
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(.white)
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [Color.teal.opacity(0.5), Color.clear]), startPoint: .bottom, endPoint: .top)
                    )
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [Color.yellow.opacity(0.3), Color.clear]), startPoint: .leading, endPoint: .trailing)
                    )
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.3), Color.clear]), startPoint: .trailing, endPoint: .leading)
                    )
                VStack {
                    HStack {
                        Text("\(journalModel.completedSessions)")
                            .font(.title.bold())
                            .foregroundColor(.black)
                            .padding()
                        ViewThatFits {
                            Text("Sessions Completed")
                                .font(.system(.headline, design: .serif))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
        //                    Image(systemName: "square.and.pencil")
                            Text("Sessions")
                                .font(.system(.headline, design: .serif))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            Text("Done")
                                .font(.system(.headline, design: .serif))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                        NewEntryButton()
                            .padding(.leading)
                    }
                }
            }
            .frame(width: width, height: 100)
            .padding(.top)
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
        .environment(AppManager.sample)
        .environment(JournalModel.sample)
        
}
