//
//  SmallEpisodeCard.swift
//  RadioNuevo
//
//  Created by SEAN BLAKE on 11/1/23.
//

import SwiftUI

struct SmallEpisodeCard: View {
    let showTitle: String
    let showBackgroundColor: Color?
    let showForegroundColor: Color?
    
    init(showTitle: String, showBackgroundColor: Color, showForegroundColor: Color) {
        self.showTitle = showTitle
        self.showBackgroundColor = showBackgroundColor
        self.showForegroundColor = showForegroundColor
    }
    
    var body: some View {
        ViewThatFits() {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.theme.accent1)
                .overlay(
                    Text(showTitle)
                        .font(.title3)
                        .fontWeight(.bold)
                        .lineLimit(2)
                        .foregroundStyle(showForegroundColor ?? Color.theme.brand)
                        .frame(maxWidth: .infinity, alignment: .leading)
                )
                .frame(width: 180, height: 80)
        }
    }
}

#Preview {
    SmallEpisodeCard(showTitle: "Big Up The World", showBackgroundColor: Color.theme.accent1, showForegroundColor: Color.theme.background)
}
