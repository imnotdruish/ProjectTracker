//
//  TextHelper.swift
//  ProjectTracker
//
//  Created by Dan June on 6/29/25.
//

import SwiftUI
import SwiftData

struct TextHelper {
    
    static func convertStat(input: Double) -> String {
        
        switch (input) {
        case let stat where input > 1000:
            // Divide by 1000, replace with "k"
            return "\(String(format: "%0.1f", stat/1000))k"
        default:
            return String(Int(input))
            
        }
    }
    
    static func limitChars(input: String, limit: Int) -> String {
        // if the input is above the limit, take the first "limit" number of characters
        if input.count > limit {
            return String(input.prefix(limit))
        }
        return input
    }
}
