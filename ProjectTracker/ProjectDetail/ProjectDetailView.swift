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
    @State private var update: ProjectUpdate?
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("Navy"), Color("Sky Blue")],
                           startPoint: .top,
                           endPoint: .bottom)
                .ignoresSafeArea()
            
            LinearGradient(colors: [Color("Washed Blue").opacity(0), Color("Sky Blue")], startPoint: .top, endPoint: .bottom)
                .frame(width: 1)
                .padding(.leading, -150)
            
            VStack {
                // Header
                VStack(alignment: .leading, spacing: 12) {
                    Text(project.name)
                        .font(.screenHeading)
                        .foregroundStyle(.white)
                    
                    HStack(alignment: .center, spacing: 12) {
                        
                        Spacer()
                        
                        StatBubbleView(title: "Hours", stat: "290", gradientStartColor: Color("Navy"), gradientEndColor: Color("Sky Blue"))
                        
                        StatBubbleView(title: "Sessions", stat: "34", gradientStartColor: Color("Turtle Green"), gradientEndColor: Color("Olive"))
                        
                        StatBubbleView(title: "Updates", stat: "32", gradientStartColor: Color("Maroon"), gradientEndColor: Color("Fuschia"))
                        
                        StatBubbleView(title: "Wins", stat: "9", gradientStartColor: Color("Maroon"), gradientEndColor: Color("Lime"))
                        
                        Spacer()
                    }
                    Text("My current focus is...")
                        .font(.featuredText)
                        .padding(.vertical, 12)
                    HStack {
                        Image(systemName: "checkmark.square")
                        Text("Design the new website")
                    }
                    .font(.featuredText)
                    .padding(.horizontal)
                    .padding(.bottom, 12)
                }
                .foregroundStyle(.white)
                .padding(.horizontal)
                .background {
                    Color.black
                        .opacity(0.7)
                        .clipShape(.rect(bottomLeadingRadius: 15, bottomTrailingRadius: 15))
                        .ignoresSafeArea()
                }

                // Project Updates
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 27) {
                        
                        ForEach(project.updates) { update in
                            ProjectUpdateView(update: update)
                        }
                    }
                    .padding()
                    .padding(.bottom, 80)
                }
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Button(action: {
                        // Add Project Update
                        self.update = ProjectUpdate()
                    }, label: {
                        ZStack {
                            Circle()
                                .foregroundStyle(.black)
                                .frame(width: 65)
                            Image("cross")
                        }
                    })
                    .padding([.leading, .top])
                    
                    Spacer()
                    Button("Back") {
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .foregroundStyle(.white)
                    .tint(.black)
                    .padding([.trailing, .top])
                }
                .background {
                    Color(.black)
                        .opacity(0.5)
                        .clipShape(.rect(topLeadingRadius: 15, topTrailingRadius: 15))
                        .ignoresSafeArea()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .sheet(item: $update) { update in
            AddUpdateView(project: project, update: update)
                .presentationDetents([.fraction(0.3)])
        }
    }
}

#Preview {
    ProjectDetailView(project: Project())
}
