//
//  CircleButton.swift
//  RadioNuevo
//
//  Created by SEAN BLAKE on 10/4/23.
//

import SwiftUI

struct CircleButton: View {
    let icon: String
    let action: () -> Void
    let backgroundColor: Color
    let foregroundColor: Color
    let iconSize: CGFloat
    
    init(icon: String,
         action: @escaping () -> Void,
         backgroundColor: Color = Color.theme.background,
         foregroundColor: Color = Color.theme.accent2,
         iconSize: CGFloat = 25) {
        self.icon = icon
        self.action = action
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.iconSize = iconSize
    }
    
    var body: some View {
        Button(action: action, label: {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: iconSize * 0.5, height: iconSize * 0.5)
                .padding(iconSize * 0.25)
                .background(backgroundColor)
                .foregroundStyle(foregroundColor)
                .clipShape(Circle())
        })
        .frame(width: iconSize, height: iconSize)
    }
}

#Preview {
    CircleButton(icon: "chevron.down", action: {})
}
