//
//  ProjectListView.swift
//  ProjectTracker
//
//  Created by Dan June on 6/24/25.
//

import SwiftUI

struct ProjectListView: View {
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
                
                        ProjectCardView()
                        ProjectCardView()
                        ProjectCardView()
                        ProjectCardView()
                        ProjectCardView()

                    }
                }
            }

            VStack {
                Spacer()
                HStack {
                    Button(action: {
                        // TODO: Add Project
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
    }
}

#Preview {
    ProjectListView()
}
