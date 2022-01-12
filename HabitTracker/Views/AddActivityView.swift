//
//  AddActivityView.swift
//  HabitTracker
//
//  Created by Peter Molnar on 12/01/2022.
//

import SwiftUI

struct AddActivityView: View {
    
    @State private var activityName = ""
    @ObservedObject var activityStore: ActivityStore
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Activity name:", text: $activityName)
            }
            .navigationTitle("Add new activity")
            .toolbar {
                Button("Save") {
                    if !activityName.isEmpty {
                        let activity = Activity(id: UUID(), name: activityName, count: 0)
                        activityStore.activities.append(activity)
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        let store =  ActivityStore()
        AddActivityView(activityStore: store)
    }
}
