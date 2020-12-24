//
//  ContentView.swift
//  HabitTracking
//
//  Created by Dave Spina on 12/21/20.
//

import SwiftUI

struct ContentView: View {
    @State private var showNewActivitySheet = false
    @ObservedObject var activityLog = ActivityLog()
    var body: some View {
         NavigationView {
            VStack {
                List(0..<activityLog.items.count) { num in
                    NavigationLink(
                        destination: UpdateActivity(activityLog: self.activityLog, activityIndex: num)) {
                        VStack {
                            Text("\(activityLog.items[num].name)")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .frame(width: 300, alignment: .leading)
                                .padding(2)
                                
                            Text("\(activityLog.items[num].description)")
                                .frame(width: 300, alignment: .leading)
                                .padding(2)
                        }
                    }
                }
                .navigationBarTitle(Text("Habit Tracking"))
                .navigationBarItems(trailing:
                    Button(action: {
                        self.showNewActivitySheet.toggle()
                    }) {
                        Text("Add New Activity")
                    }
                )
            }.sheet(isPresented: $showNewActivitySheet) {
                NewActivity(activityLog: self.activityLog)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var actLog: ActivityLog {
        var log = ActivityLog()
        if log.items.count == 0 {
            let act = Activity(name: "Study", description: "Be sure to study")
            log.items.append(act)
        }
        return log
    }
    static var previews: some View {

        ContentView()
    }
}
