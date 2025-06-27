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
                    Text("\(update.hours, specifier: "%.2f") Hours")
                        .padding(.trailing)
                }
                .padding(.vertical, 10)
                .background {
                    Color("Orchid")
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
