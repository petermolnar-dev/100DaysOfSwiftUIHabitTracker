//
//  HabitsStore.swift
//  HabitTracker
//
//  Created by Peter Molnar on 10/01/2022.
//

import Foundation

class ActivityStore: ObservableObject {
    
    static let activityStorageKey = "Activities"
    
    init() {
        if let savedActivities = Foundation.UserDefaults.standard.data(forKey: ActivityStore.activityStorageKey) {
            if let decodedActivities = try? JSONDecoder().decode([Activity].self, from: savedActivities) {
                activities = decodedActivities
                return
            }
        }
        activities = []
    }
    
    @Published var activities = [Activity]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                Foundation.UserDefaults.standard.set(encoded, forKey: ActivityStore.activityStorageKey)
            }
        }
    }
}
