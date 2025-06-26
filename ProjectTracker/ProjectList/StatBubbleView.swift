//
//  StatBubbleView.swift
//  ProjectTracker
//
//  Created by Dan June on 6/26/25.
//

import SwiftUI

struct StatBubbleView: View {
    
    var title: String
    var stat: String
    var gradientStartColor: Color
    var gradientEndColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(LinearGradient(colors: [gradientStartColor, gradientEndColor], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 60, height: 40)
            VStack {
                Text(title)
                    .font(.captionText)

                Text(stat)
                    .font(.featuredNumber)
                    .bold()
            }
            .foregroundStyle(.white)
        }
        .padding(.trailing, 12)
    }
}

#Preview {
    StatBubbleView(title: "Hours", stat: "290", gradientStartColor: Color("Navy"), gradientEndColor: Color("Blue"))
}
