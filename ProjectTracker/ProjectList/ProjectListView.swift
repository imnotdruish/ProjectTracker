//
//  ProjectListView.swift
//  ProjectTracker
//
//  Created by Dan June on 6/24/25.
//

import SwiftUI
import SwiftData

struct ProjectListView: View {
    
    @State private var newProject: Project?
    @Query private var projects: [Project]
    @State private var selectedProject: Project?
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [Color("Deep Purple"), Color("Blush Pink")],
                               startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    
                    Text("Projects")
                        .font(.screenHeading)
                        .foregroundStyle(.white)
                        .padding(.leading, 20)
                    
                    if projects.count > 0 {
                        ScrollView(showsIndicators: false) {
                            
                            VStack(alignment: .leading, spacing: 26) {
                                
                                ForEach(projects) { p in
                                    
                                    ProjectCardView(project: p)
                                        .onTapGesture {
                                            selectedProject = p
                                        }
                                        .onLongPressGesture {
                                            newProject = p
                                        }
                                }
                            }
                        }
                    } else {
                        Spacer()
                        HStack {
                            Spacer()
                            Button("Tap to add a new project") {
                                newProject = Project()
                            }
                            .buttonStyle(.bordered)
                            .foregroundStyle(.white)
                            .tint(.blue)
                            Spacer()
                        }
                        Spacer()
                    }
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Button(action: {
                            // Create New Project
                            self.newProject = Project()
                        }, label: {
                            ZStack {
                                Circle()
                                    .frame(width: 65)
                                    .foregroundStyle(.black)
                                Image("cross")
                            }
                        })
                        Spacer()
                    }
                }
                .padding(.leading)
            }
            .navigationDestination(item: $selectedProject) { project in
                ProjectDetailView(project: project)
            }
            .sheet(item: $newProject) { project in
                let isEdit = project.name.trimmingCharacters(in: .whitespacesAndNewlines) != ""
                
                EditProjectView(project: project, isEditMode: isEdit)
                    .presentationDetents([.fraction(0.2)])
            }
        }
    }
}

#Preview {
    ProjectListView()
}
