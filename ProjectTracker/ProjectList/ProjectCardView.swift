//
//  ProjectCardView.swift
//  ProjectTracker
//
//  Created by Dan June on 6/26/25.
//

import SwiftUI

struct ProjectCardView: View {
    
    var project: Project
    
    var body: some View {
    
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 15)
                .opacity(0.7)
                .shadow(radius: 5, x: 0, y: 4)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(project.name)
                    .font(.bigHeadline)
                    .foregroundStyle(.white)
                HStack(alignment: .center, spacing: 12) {
                    
                    Spacer()
                    
                    StatBubbleView(title: "Hours", stat: project.hours, gradientStartColor: Color("Navy"), gradientEndColor: Color("Sky Blue"))
                    
                    StatBubbleView(title: "Sessions", stat: Double(project.sessions), gradientStartColor: Color("Turtle Green"), gradientEndColor: Color("Olive"))
                    
                    StatBubbleView(title: "Updates", stat: Double(project.updates.count), gradientStartColor: Color("Maroon"), gradientEndColor: Color("Fuschia"))
                    
                    StatBubbleView(title: "Wins", stat: Double(project.wins), gradientStartColor: Color("Maroon"), gradientEndColor: Color("Lime"))
                    
                    Spacer()
                }
                if project.focus.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                    Text("My current focus is...")
                        .font(.featuredText)
                        .foregroundStyle(.gray)
                    Text("Design the new website")
                        .font(.featuredText)
                        .foregroundStyle(.gray)
                        .bold()
                }
            }
            .padding()
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProjectCardView(project: Project())
}
