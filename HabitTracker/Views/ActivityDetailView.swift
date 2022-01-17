//
//  ActivityDetailView.swift
//  HabitTracker
//
//  Created by Peter Molnar on 12/01/2022.
//

import SwiftUI

struct ActivityDetailView: View {
    
    @ObservedObject var activityStore: ActivityStore
    @State var activity: Activity
    @State var stepperValue = 0
    
    func onIncrement() {
        stepperValue += 1
        updateActivity()
    }
    
    func onDecrement() {
        stepperValue -= 1
        if stepperValue < 0 { stepperValue = 0 }
        updateActivity()
    }
    
    func updateActivity() {

        let newCount = activity.count + stepperValue
        let newActivity = Activity(id: activity.id,
                                   name: activity.name,
                                   count: newCount)
        let index = activityStore.activities.firstIndex(where: { $0.id == activity.id } )
        if let index = index {
            activityStore.activities[index] = newActivity
        }
    }
    
    var body: some View {
        Form {
            Text("\(activity.name)")
                .font(.headline)
            HStack{
                Stepper("Time spent: \(stepperValue)") {
                    onIncrement()
                } onDecrement: {
                    onDecrement()
                }

            }
        }
    }
}

struct ActivityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let store = ActivityStore()
        let activity = Activity(id: UUID(), name: "TestActivity", count: 0)
        store.activities.append(activity)
        return ActivityDetailView(activityStore: store, activity: activity)
    }
}
