//
//  Activity.swift
//  HabitTracker
//
//  Created by Peter Molnar on 10/01/2022.
//

import Foundation

struct Activity: Identifiable, Codable, Equatable {
    let id: UUID
    let name: String
    var count: Int
}
