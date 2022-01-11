//
//  HabitsStore.swift
//  HabitTracker
//
//  Created by Peter Molnar on 10/01/2022.
//

import Foundation

class ActivityStore: ObservableObject {
    @Published var activities: [Activity] = []
    
    func add(_ activity: Activity) {
        activities.append(activity)
    }
    
    func increase(_ activity: Activity, with adding: Int) {
        
        // Check if there is an activity
        // If yes, increase the counter.
    }
}
