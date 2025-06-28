//
//  AddUpdateView.swift
//  ProjectTracker
//
//  Created by Dan June on 6/27/25.
//

import SwiftUI
import SwiftData

struct AddUpdateView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    var project: Project
    var update: ProjectUpdate
    
    @State private var headline: String = ""
    @State private var summary: String = ""
    @State private var hours: String = ""
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text("New Update")
                    .font(.bigHeadline)
                    .foregroundStyle(.white)

                TextField("Headline", text: $headline)

                TextField("Summary", text: $summary, axis: .vertical)
                
                HStack {
                    
                    TextField("Hours", text: $hours)
                        .keyboardType(.numberPad)
                        .frame(width: 60)
                    
                    Button("Save", action: {
                        // Save Project Update
                        update.headline = headline
                        update.summary = summary
                        update.hours = Double(hours)!
                        project.updates.insert(update, at: 0)
                        dismiss()
                    })
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                }

                Spacer()
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
            .padding(.top)
        }
    }
}

#Preview {
    AddUpdateView(project: Project(), update: ProjectUpdate())
}
