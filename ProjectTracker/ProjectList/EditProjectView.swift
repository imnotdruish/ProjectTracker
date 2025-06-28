//
//  EditProjectView.swift
//  ProjectTracker
//
//  Created by Dan June on 6/26/25.
//

import SwiftUI
import SwiftData

struct EditProjectView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    var project: Project
    var isEditMode: Bool

    @State private var projectName: String = ""
    @State private var showConfirmation: Bool = false
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text(isEditMode ? "Edit Project" : "Add Project")
                    .font(.bigHeadline)
                    .foregroundStyle(.white)
                HStack {
                    TextField("Project Name", text: $projectName)
                        .textFieldStyle(.roundedBorder)
                    
                    Button(isEditMode ? "Edit" : "Add", action: {
                        if isEditMode {
                            // Save a new project name
                            project.name = projectName
                        } else {
                            // Add a new project
                            project.name = projectName
                            context.insert(project)
                        }
                        dismiss()
                    })
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    .disabled(projectName.isEmpty)
                    
                    if isEditMode {
                        // Show Delete button
                        Button("Delete") {
                            // Show confirmation dialog
                            showConfirmation = true
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
        }
        .confirmationDialog("Really Delete?", isPresented: $showConfirmation, titleVisibility: .visible) {
            Button("Yes, delete it") {
                // Delete project from SwiftData
                context.delete(project)
                dismiss()
            }
        }
        .onAppear {
            projectName = project.name
        }
    }
}

//#Preview {
//    AddProjectView()
//}
