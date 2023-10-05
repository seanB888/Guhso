//
//  PlayerControl.swift
//  RadioNuevo
//
//  Created by SEAN BLAKE on 10/4/23.
//

import SwiftUI

struct PlayerControl: View {
    @ObservedObject var viewModel = PodcastViewModel()
    @ObservedObject var audioPlayerManager: AudioPlayerManager
    @State private var iconSize: CGFloat = 25.0
    @State private var playIcon: CGFloat = 85.0
    @State private var playPause: Bool = false
    @State private var isFav: Bool = false
    let actionPlay: () -> Void
    let actionBackward: () -> Void
    let actionForward: () -> Void
    
    
    var body: some View {
        VStack(spacing: 10) {
            // ProgressBar
            CustomProgressBar(
                currentTime: $audioPlayerManager.currentTime,
                duration: audioPlayerManager.duration
            ) { newTime in
                audioPlayerManager.seek(to: newTime)
            }
            
            HStack(spacing: 20){
                // Backward button | 15 seconds increments...
                Button(action: { actionBackward() }, label: {
                    Image(systemName: "backward.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: iconSize, height: iconSize)
                })
                Spacer()
                
                // Play button | switch from Play and Pause icon...
                Button(action: {
                    playPause.toggle()
                    actionPlay()
                }, label: {
                    Image(systemName: playPause ? "pause.circle.fill" : "play.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: playIcon, height: playIcon)
                })
                Spacer()
                
                // Forward button | 15 seconds increments...
                Button(action: { actionForward() }, label: {
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
    PlayerControl(audioPlayerManager: AudioPlayerManager(), actionPlay: {}, actionBackward: {}, actionForward: {})
}
