//
//  ProjectDetailView.swift
//  ProjectTracker
//
//  Created by Dan June on 6/26/25.
//

import SwiftUI
import SwiftData

struct ProjectDetailView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    var project: Project
    @State private var newUpdate: ProjectUpdate?
    @State private var showEditFocus = false
    @State private var animationOffset = 800
    
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
                        
                        StatBubbleView(title: "Hours", stat: project.hours, gradientStartColor: Color("Navy"), gradientEndColor: Color("Sky Blue"))
                        
                        StatBubbleView(title: "Sessions", stat: Double(project.sessions), gradientStartColor: Color("Turtle Green"), gradientEndColor: Color("Olive"))
                        
                        StatBubbleView(title: "Updates", stat: Double(project.updates.count), gradientStartColor: Color("Maroon"), gradientEndColor: Color("Fuschia"))
                        
                        StatBubbleView(title: "Wins", stat: Double(project.wins), gradientStartColor: Color("Maroon"), gradientEndColor: Color("Lime"))
                        
                        Spacer()
                    }
                    Text("My current focus is...")
                        .font(.featuredText)
                        .padding(.vertical, 12)
                    HStack {
                        if project.focus.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                            Button {
                                // Complete the milestone
                                completeMilestone()
                            } label: {
                                Image(systemName: "checkmark.square")
                            }
                        }
                        Text(project.focus.trimmingCharacters(in: .whitespacesAndNewlines) == "" ? "Tap to set your focus" : project.focus)
                            .font(.featuredText)
                            .onTapGesture {
                                // Display the edit focus form
                                showEditFocus = true
                            }
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
                if project.updates.count > 0 {
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 27) {
                            
                            let sortedArray = project.updates.sorted(by: { u1, u2 in
                                u1.date > u2.date
                            })
                            
                            ForEach(Array(sortedArray.enumerated()), id: \.element) {
                                index, update in
                                
                                ProjectUpdateView(update: update)
                                    .animation(.easeOut.delay(TimeInterval(0.15 * Double(index))),
                                               value: animationOffset)
                                    .offset(x: CGFloat(animationOffset))
                                    .onTapGesture {
                                    }
                                    .onLongPressGesture {
                                        newUpdate = update
                                    }
                            }
                        }
                        .padding()
                        .padding(.bottom, 80)
                    }
                } else {
                    // No Project Update
                    Spacer()
                    HStack {
                        Spacer()
                        Button("Tap to add a new update") {
                            newUpdate = ProjectUpdate()
                        }
                        .buttonStyle(.bordered)
                        .foregroundStyle(.white)
                        .tint(.blue)
                        .padding(.bottom, 100)
                        Spacer()
                    }
                    Spacer()
                }
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Button(action: {
                        // Add Project Update
                        newUpdate = ProjectUpdate()
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
        .sheet(item: $newUpdate) { update in
            let isEdit = update.headline.trimmingCharacters(in: .whitespacesAndNewlines) != ""
            EditUpdateView(project: project, update: update, isEditMode: isEdit)
                .presentationDetents([.fraction(0.3)])
        }
        .sheet(isPresented: $showEditFocus) {
            EditFocusView(project: project)
                .presentationDetents([.fraction(0.2)])
            
        }
        .onAppear {
            withAnimation {
                animationOffset = 0
            }
        }
    }
    
    func completeMilestone() {
        // Create a new project update for milestone
        let update = ProjectUpdate()
        update.updateType = .milestone
        update.headline = "Milestone Acheived"
        update.summary = project.focus
        project.updates.insert(update, at: 0)
        
        // Update the stats
        StatHelper.updateAdded(project: project, update: update)

        // Clear the project focus
        withAnimation {
            project.focus = ""
        }
    }
}

#Preview {
    ProjectDetailView(project: Project())
}
