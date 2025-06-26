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
    
    var body: some View {

        ZStack {
            LinearGradient(colors: [Color("Deep Purple"), Color("Blush Pink")],
                           startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()

            VStack(alignment: .leading) {
                
                Text("Projects")
                    .font(.screenHeading)
                    .foregroundStyle(.white)
                    .padding(.leading, 20)
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 26) {
                        
                        ForEach(projects) { p in
                            ProjectCardView(project: p)
                        }
                    }
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
        .sheet(item: $newProject) { project in
            AddProjectView(project: project)
                .presentationDetents([.fraction(0.2)])
        }
    }
}

#Preview {
    ProjectListView()
}
