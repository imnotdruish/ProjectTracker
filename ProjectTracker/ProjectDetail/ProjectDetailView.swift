//
//  ProjectDetailView.swift
//  ProjectTracker
//
//  Created by Dan June on 6/26/25.
//

import SwiftUI
import SwiftData

struct ProjectDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    var project: Project
    
    var body: some View {
        VStack {
            Text(project.name)
                .navigationBarBackButtonHidden(true)
            
            Button("Back") {
                // Navigate Back
                dismiss()
            }
        }
    }
}

#Preview {
    ProjectDetailView(project: Project())
}
