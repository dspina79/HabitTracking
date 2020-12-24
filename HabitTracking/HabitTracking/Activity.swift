//
//  Activity.swift
//  HabitTracking
//
//  Created by Dave Spina on 12/21/20.
//

import Foundation

struct Activity: Codable, Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var numberOfTimesCompleted: Int
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
        self.numberOfTimesCompleted = 0
    }
    
    mutating public func incrementActivity() {
        self.numberOfTimesCompleted += 1
    }
}

class ActivityLog: ObservableObject {
    let storageKey = "ActivityLog_Items"
    @Published public var items: [Activity] {
        didSet {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(items) {
                UserDefaults.standard.setValue(data, forKey: storageKey)
            }
        }
    }
    
    
    init() {
        if let data = UserDefaults.standard.data(forKey: storageKey) {
            var decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Activity].self, from: data) {
                self.items = decoded
                return
            }
        }
        
        self.items = [Activity]()
    }
    
    init(activity: Activity) {
        self.items = [Activity]()
        self.items.append(activity)
    }
}
