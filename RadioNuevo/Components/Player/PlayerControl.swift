//
//  PlayerControl.swift
//  RadioNuevo
//
//  Created by SEAN BLAKE on 10/4/23.
//

import SwiftUI

struct PlayerControl: View {
    @State private var iconSize: CGFloat = 25.0
    @State private var playIcon: CGFloat = 85.0
    @State private var playPause: Bool = false
    @State private var isFav: Bool = false
    let action: () -> Void
    
    var body: some View {
        VStack(spacing: 10) {
            // ProgressBar
            CustomProgressBar(currentTime: 1.16, duration: 3.50)
            
            HStack(spacing: 20){
                // Backward button | 15 seconds increments...
                Button(action: {}, label: {
                    Image(systemName: "backward.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: iconSize, height: iconSize)
                })
                Spacer()
                
                // Play button | switch from Play and Pause icon...
                Button(action: {
                    playPause.toggle()
                    action()
                }, label: {
                    Image(systemName: playPause ? "pause.circle.fill" : "play.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: playIcon, height: playIcon)
                })
                Spacer()
                
                // Forward button | 15 seconds increments...
                Button(action: { }, label: {
                    Image(systemName: "forward.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: iconSize, height: iconSize)
                })
            }
            .foregroundStyle(Color.theme.brand)
            
            HStack(spacing: 20) {
                Button(action: {
                    // Logic here
                    
                }, label: {
                    Image(systemName: "arrowshape.turn.up.right.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: iconSize, height: iconSize)
                })
                Spacer()
                // Favorite button...
                Button(action: {
                    isFav.toggle()
                    
                }, label: {
                    Image(systemName: isFav ? "suit.heart.fill" : "suit.heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: iconSize, height: iconSize)
                })
            }
            .foregroundStyle(Color.theme.brand)
        }
    }
}

#Preview {
    PlayerControl(action: {})
}
