//
//  ProjectListView.swift
//  ProjectTracker
//
//  Created by Dan June on 6/24/25.
//

import SwiftUI

struct ProjectListView: View {
    var body: some View {
        VStack {
            Image("cross")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(Font.screenHeading)
                .foregroundStyle(Color("Olive"))
        }
        .padding()
    }
}

#Preview {
    ProjectListView()
}
