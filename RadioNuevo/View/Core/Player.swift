//
//  Player.swift
//  RadioNuevo
//
//  Created by SEAN BLAKE on 10/4/23.
//

import SwiftUI

struct Player: View {
    @EnvironmentObject var viewModel: PodcastViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var shareImage = Image("logo")
    
    private var currentEpisode: Episode? {
        viewModel.selectedEpisode
    }
    
    var body: some View {
        ZStack {
            if let episode = viewModel.selectedEpisode {
                ZStack {
                    Image("logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 250, height: 250)
                        .ignoresSafeArea()
                        .offset(y: 100)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .background(Color.theme.background)
                
                VStack(alignment: .leading, spacing: 5) {
                    HStack(alignment: .top) {
                        // Close button...
                        CircleButton(icon: "chevron.down", action: {
                            dismiss()
                        }, backgroundColor: Color.theme.brand)
                        Spacer()
                        Text("Guhso Radio")
                            .foregroundStyle(Color.theme.accent1)
                        Spacer()
                        
                        ShareLink(item: shareImage,
                                  preview: SharePreview("Share this Episode", image: shareImage)
                        ) {
                            Image(systemName: "ellipsis")
                                .font(.title3)
                                .rotationEffect(Angle(degrees: 90))
                        }
                        .foregroundStyle(Color.theme.brand)
                    }
                    .padding(.top, 45)
                    Spacer()
                    
                    // Title of the show...
                    VStack {
                         Text(episode.title)
                    }
                    .foregroundStyle(Color.theme.brand)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .textCase(.uppercase)
                    .lineLimit(1)
                    
                    // Description of the show...
                    VStack {
                        Text(episode.description?.strippedHTMLTags ?? "")
                        
                    }
                    .foregroundStyle(Color.gray)
                    .font(.body)
                    .lineLimit(3)
                    
                    // Player Controls...
                    PlayerControl(
                        audioPlayerManager: viewModel.audioPlayerManager,
                        actionPlay: {
                            if let url = URL(string: viewModel.selectedEpisode?.enclosure?.url ?? "") {
                                viewModel.audioPlayerManager.togglePlayback(url: url)
                            }
                        },
                        actionBackward: {viewModel.audioPlayerManager.skip(by: -15)},
                        actionForward: {viewModel.audioPlayerManager.skip(by: 15)}
                    )
                    .padding(.top, 10)
                    .padding(.bottom, 50)
                    
                }
                .padding(25)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            } else {
                Text("No Episode Selected")
            }
        }
        .onAppear {
            if let url = URL(string: currentEpisode?.enclosure?.url ?? "") {
                viewModel.audioPlayerManager.play(url: url)
            }
        }
    }
}

#Preview {
    Player()
        .environmentObject(PodcastViewModel())
}
