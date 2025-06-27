//
//  ProjectUpdateView.swift
//  ProjectTracker
//
//  Created by Dan June on 6/27/25.
//

import SwiftUI

struct ProjectUpdateView: View {
    
    var project: Project
    var date: String
    var hours: Double
    var bgColor: String
    var projectHeadline: String
    var projectSummary: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.black)
                .shadow(radius: 5, x: 0,y: 4)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(date)
                        .padding(.leading)
                    Spacer()
                    Text("\(hours, specifier: "%.1f") Hours")
                        .padding(.trailing)
                }
                .padding(.vertical, 10)
                .background {
                    Color(bgColor)
                }
                Text(projectHeadline)
                    .font(.smallHeadline)
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                Text(projectSummary)
                    .padding(.horizontal)
                    .padding(.bottom, 10)
            }
            .foregroundStyle(.white)
            .font(.regularText)

        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    ProjectUpdateView(project: Project(), date: "Thursday, September 16, 2023", hours: 9, bgColor: "Orchid", projectHeadline: "Project Headline", projectSummary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Manecenas sit amet lacinia dolor. Etiam rhoncus et ante ac cursus. Vestibulu frinilla venenatis. Donec et porta mauris.")
}
