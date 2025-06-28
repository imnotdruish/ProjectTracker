//
//  EditUpdateView.swift
//  ProjectTracker
//
//  Created by Dan June on 6/27/25.
//

import SwiftUI
import SwiftData

struct EditUpdateView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    var project: Project
    var update: ProjectUpdate
    var isEditMode: Bool
    
    @State private var headline: String = ""
    @State private var summary: String = ""
    @State private var hours: String = ""
    @State private var showConfirmation: Bool = false
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text(isEditMode ? "Edit Update" : "Add Update")
                    .font(.bigHeadline)
                    .foregroundStyle(.white)

                TextField("Headline", text: $headline)

                TextField("Summary", text: $summary, axis: .vertical)
                
                HStack {
                    
                    TextField("Hours", text: $hours)
                        .keyboardType(.numberPad)
                        .frame(width: 60)
                    
                    Button(isEditMode ? "Save" : "Add", action: {
                        update.headline = headline
                        update.summary = summary
                        update.hours = Double(hours)!

                        if !isEditMode {
                            // Add Project Update
                            project.updates.insert(update, at: 0)
                        }
                        
                        dismiss()
                    })
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    
                    if isEditMode {
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
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
            .padding(.top)
        }
        .confirmationDialog("Really delete this update?", isPresented: $showConfirmation) {
            Button("Yes, delete it") {
                // Remove all updates from the project with the same id
                project.updates.removeAll { u in
                    u.id == update.id
                }
                dismiss()
            }
        }
        .onAppear {
            headline = update.headline
            summary = update.summary
            hours = String(update.hours)
        }
    }
}

#Preview {
    EditUpdateView(project: Project(), update: ProjectUpdate(), isEditMode: false)
}
