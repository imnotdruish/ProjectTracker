//
//  ProjectTrackerApp.swift
//  ProjectTracker
//
//  Created by Dan June on 6/24/25.
//

import SwiftUI
import SwiftData

@main
struct ProjectTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ProjectListView()
                .modelContainer(for: [Project.self, ProjectUpdate.self])
        }
    }
}
