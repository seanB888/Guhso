//
//  PlayButton.swift
//  RadioNuevo
//
//  Created by SEAN BLAKE on 10/19/23.
//

import SwiftUI

struct PlayButton: View {
    // Closure for button action
    let action: () -> Void
    
    // Image names for button states
    let imageName: String
    
    // Button appearance
    let buttonColor: Color
    let imageColor: Color
    
    // Constants for better readability
    private let buttonDiameter: CGFloat = 80.0
    
    // icon size
    private let iconSize: CGFloat = 30
    
    init(action: @escaping () -> Void, imageName: String, buttonColor: Color = .blue, imageColor: Color = .white) {
        self.action = action
        self.imageName = imageName
        self.buttonColor = buttonColor
        self.imageColor = imageColor
    }
    
    var body: some View {
        Button(action: action) {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: iconSize, height: iconSize)
        }
        .frame(width: buttonDiameter, height: buttonDiameter)
        .foregroundColor(imageColor)
        .background(buttonColor)
        .clipShape(Circle())
    }
}

struct PlayButton_Previews: PreviewProvider {
    static var previews: some View {
        PlayButton(action: {
            print("Button tapped")
        }, imageName: "play.fill")
    }
}
