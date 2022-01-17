//
//  ContentView.swift
//  HabitTracker
//
//  Created by Peter Molnar on 06/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var activityStore = ActivityStore()
    @State private var showingNewActivitySheet = false
    
    var body: some View {
        NavigationView {
            List{
                ForEach(activityStore.activities) { activity in
                    NavigationLink {
                        ActivityDetailView(activityStore: activityStore, activity: activity)
                    } label: {
                        HStack {
                            Text(activity.name)
                                .font(.headline)
                            Spacer()
                            Text(activity.count, format:  .number)
                                .fontWeight(.light)
                        }
                    }
                }
                
            }
            .navigationTitle("Activities")
            .toolbar {
                Button {
                    showingNewActivitySheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingNewActivitySheet) {
            AddActivityView(activityStore: activityStore)
        }
    }
    
    func addNewActivity() {
        let activity = Activity(id: UUID(),
                                name: "Whatever", count: Int.random(in: 1...300))
        activityStore.activities.append(activity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
