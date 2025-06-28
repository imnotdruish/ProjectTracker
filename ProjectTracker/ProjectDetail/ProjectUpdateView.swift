//
//  ProjectUpdateView.swift
//  ProjectTracker
//
//  Created by Dan June on 6/27/25.
//

import SwiftUI

struct ProjectUpdateView: View {
    
    var update: ProjectUpdate
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.black)
                .shadow(radius: 5, x: 0,y: 4)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(DateHelper.projectUpdateDate(inputDate: update.date))
                        .padding(.leading)
                    Spacer()
                    // Display star if milestone, otherwise hours
                    if update.updateType == .milestone {
                        Image(systemName: "star.fill")
                            .padding(.trailing)
                            .foregroundStyle(.yellow)
                    } else {
                        Text("\(String(Int(update.hours))) Hours")
                            .padding(.trailing)
                    }
                }
                .padding(.vertical, 10)
                .background {
                    Color(update.updateType == .milestone ? "Persian Blue" : "Orchid")
                }
                Text(update.headline)
                    .font(.smallHeadline)
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                Text(update.summary)
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
    ProjectUpdateView(update: ProjectUpdate())
}
