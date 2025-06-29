//
//  EditFocusView.swift
//  ProjectTracker
//
//  Created by Dan June on 6/28/25.
//

import SwiftUI

struct EditFocusView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    var project: Project
    @State var focus: String = ""
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text("Edit Project Focus")
                    .font(.bigHeadline)
                    .foregroundStyle(.white)
                
                HStack {
                    TextField("Focus", text: $focus)
                        .textFieldStyle(.roundedBorder)
                    
                    Button("Save") {
                        withAnimation {
                            // Save focus for the project
                            project.focus = focus
                        }
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    .disabled(focus.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)

                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
        }
    }
}

//#Preview {
//    EditFocusView()
//}
