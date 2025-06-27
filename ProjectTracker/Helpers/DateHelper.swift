//
//  DateHelper.swift
//  ProjectTracker
//
//  Created by Dan June on 6/27/25.
//

import Foundation

struct DateHelper {
    static func projectUpdateDate(inputDate: Date) -> String {
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM, d, yyyy"
        return df.string(from: inputDate)
    }
}
