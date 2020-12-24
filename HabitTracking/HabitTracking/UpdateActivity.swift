//
//  UpdateActivity.swift
//  HabitTracking
//
//  Created by Dave Spina on 12/23/20.
//

import SwiftUI

struct UpdateActivity: View {
    @ObservedObject var activityLog: ActivityLog
    var activityIndex: Int
    var body: some View {
        VStack {
            Text("Update: \(activityLog.items[activityIndex].name)")
                .font(.headline)
            Text("\(activityLog.items[activityIndex].description)")
                .font(.subheadline)
            Text("Number of times completed:\t\(activityLog.items[activityIndex].numberOfTimesCompleted)")
                .frame(width: 300, alignment: .center)
                .padding(10)
            Button("Increment!") { activityLog.items[activityIndex].incrementActivity()
            }
            .frame(width: 120, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
        }
    }
}

struct UpdateActivity_Previews: PreviewProvider {
    static let testAct = Activity(name: "Test Activity", description: "A sample activity for previewing")
    static let testLog: ActivityLog = ActivityLog(activity: testAct)
    static var previews: some View {
        
        UpdateActivity(activityLog: testLog, activityIndex: 0)
    }
}
