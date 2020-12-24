//
//  NewActivity.swift
//  HabitTracking
//
//  Created by Dave Spina on 12/21/20.
//

import SwiftUI

struct NewActivity: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name: String = ""
    @State private var description: String = ""
    @ObservedObject public var activityLog: ActivityLog
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.green, .black]), startPoint: .top, endPoint: .bottom)
                VStack {
                    Form {
                        Text("Add New Activity")
                            .font(.headline)
                        TextField("Activity Name", text: $name)
                        TextField("Description", text: $description)
                    }.frame(width: 300, height: 350, alignment: .top)
                    Spacer()
                    Button("Add") {
                        guard self.name != "" else {
                            return
                        }
                        
                        let newAct = Activity(name: self.name, description: self.description)
                        activityLog.items.append(newAct)
                        presentationMode.wrappedValue.dismiss()
                    }
                    .frame(width: 120, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.white)
                    .clipShape(Capsule())
                
                }
                .padding(.horizontal)
        }
    }
}

struct NewActivity_Previews: PreviewProvider {
    static var previews: some View {
        NewActivity(activityLog: ActivityLog())
    }
}
