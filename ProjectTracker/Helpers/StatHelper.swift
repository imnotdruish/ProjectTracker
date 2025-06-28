//
//  StatHelper.swift
//  ProjectTracker
//
//  Created by Dan June on 6/28/25.
//

import Foundation
import SwiftUI

struct StatHelper {
    
    // This method should be run AFTER the new update has been added to project's updates array
    static func updateAdded(project: Project, update: ProjectUpdate) {
        
        // Change hours
        project.hours += update.hours
        
        // Change wins
        if update.updateType == .milestone {
            project.wins += 1
        }
        
        // Change sessions
        let sortedUpdates = project.updates.sorted { u1, u2 in
            u1.date > u2.date
        }
        if sortedUpdates.count >= 2 {
            // Check if the latest two updates have the same date
            let date1 = sortedUpdates[0].date
            let date2 = sortedUpdates[1].date
            if !Calendar.current.isDate(date1, inSameDayAs: date2) {
                // if not the same day
                project.sessions += 1
            }
        } else {
            // Since there are less than 2 updates, then this is the first of today
            project.sessions += 1
        }
    }

    // Run this AFTER update has been removed from project.updates array
    static func updateDeleted(project: Project, update: ProjectUpdate) {
        // Change hours
        project.hours -= update.hours
        
        // Change wins
        if update.updateType == .milestone {
            project.wins -= 1
        }
        
        // Change sessions
        let sameDayUpdates = project.updates.filter { u in
            Calendar.current.isDate(u.date, inSameDayAs: update.date)
        }
        if sameDayUpdates.count == 0 {
            // That means that deleted update was the only update of that day
            project.sessions -= 1
        }
    }
    
    static func updateEdited(project: Project, hoursDifference: Double) {
        // Change Hours
        project.hours += hoursDifference
    }
}
