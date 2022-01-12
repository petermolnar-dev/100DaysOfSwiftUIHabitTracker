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
    
    var body: some View {
        Form {
            HStack{
                Text("Activity name: \(activity.name)")
                    .font(.headline)
                Stepper("Time spent:", value: $stepperValue, in: 0...100)
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
