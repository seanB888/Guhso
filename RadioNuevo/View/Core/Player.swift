//
//  Player.swift
//  RadioNuevo
//
//  Created by SEAN BLAKE on 10/4/23.
//

import SwiftUI

struct Player: View {
    @ObservedObject var viewModel = PodcastViewModel()
    @Environment(\.dismiss) private var dismiss
    @State private var picSize: CGFloat = 250
    @State private var shareImage = Image("logo")
    
    private var currentEpisode: Episode? {
        viewModel.podcast?.episodes.first
    }
    
    var body: some View {
        ZStack {
            ZStack {
                Image("logo")
                    .resizable()
                    .scaledToFill()
                //.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .frame(width: picSize, height: picSize)
                    .ignoresSafeArea()
                //                    .overlay(
                //                        LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .top, endPoint: .bottom)
                //                    )
                    .padding(.top, 120)
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
                    // Share button...
//                    CircleButton(icon: "ellipsis", action: {
//
//                    }, backgroundColor: Color.theme.brand)
//                        .rotationEffect(Angle(degrees: 90))
                    
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
                    if let episodeTitle = currentEpisode?.title {
                        Text(episodeTitle)
                    } else {
                        Text("loading...")
                    }
                }
                .foregroundStyle(Color.theme.brand)
                .font(.largeTitle)
                .fontWeight(.black)
                .textCase(.uppercase)
                .lineLimit(1)
                
                // Description of the show...
                VStack {
                    if let episodeDescription = currentEpisode?.description {
                        Text(episodeDescription.strippedHTMLTags)
                    } else {
                        Text("loading...")
                    }
                    
                }
                .foregroundStyle(Color.gray)
                .font(.body)
                .lineLimit(3)
                
                // Player Controls...
                PlayerControl(action: {
                    if let url = URL(string: currentEpisode?.enclosure?.url ?? "") {
                        viewModel.audioPlayerManager.togglePlayback(url: url)
                    }
                })
                    .padding(.top, 10)
                    .padding(.bottom, 50)
                
            }
            .padding(25)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
        }
        .onAppear {
            if viewModel.podcast == nil {
                viewModel.fetchPodcastData()
            }
        }
    }
}

#Preview {
    Player()
}
