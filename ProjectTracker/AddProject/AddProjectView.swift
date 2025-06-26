//
//  AddProjectView.swift
//  ProjectTracker
//
//  Created by Dan June on 6/26/25.
//

import SwiftUI
import SwiftData

struct AddProjectView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    var project: Project
    @State var projectName: String = ""
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text("New Project")
                    .font(.bigHeadline)
                    .foregroundStyle(.white)
                HStack {
                    TextField("Project Name", text: $projectName)
                        .textFieldStyle(.roundedBorder)
                    
                    Button("Save", action: {
                        project.name = projectName
                        context.insert(project)
                        dismiss()
                    })
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
        }
    }
}

//#Preview {
//    AddProjectView()
//}
