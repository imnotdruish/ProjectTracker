//
//  StatBubbleView.swift
//  ProjectTracker
//
//  Created by Dan June on 6/26/25.
//

import SwiftUI

struct StatBubbleView: View {
    
    var title: String
    var stat: Double
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

                Text(TextHelper.convertStat(input: Double(stat)))
                    .contentTransition(.numericText())
                    .font(.featuredNumber)
                    .bold()
            }
            .foregroundStyle(.white)
        }
        .padding(.trailing, 12)
    }
}

#Preview {
    StatBubbleView(title: "Hours", stat: 290.0, gradientStartColor: Color("Navy"), gradientEndColor: Color("Sky Blue"))
}
