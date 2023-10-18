//
//  Home.swift
//  RadioNuevo
//
//  Created by SEAN BLAKE on 10/6/23.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var viewModel: PodcastViewModel
    
    var body: some View {
        VStack {
            Text("Featured")
                .font(.title.bold())
            GeometryReader { gr in
                TabView {
                    ForEach(0 ..< 5) { item in
                        VStack(spacing: 0) {
                            FeaturedCrad()
                                .frame(width: gr.size.width, height: gr.size.height)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            }
            
            
            List(viewModel.podcast?.episodes ?? [], id: \.title) { episode in
                Button(action: {
                    viewModel.selectEpisode(episode)
                    viewModel.isPlayerPresented = true
                }, label: {
                    Text(episode.title)
                })
            }
            .sheet(isPresented: $viewModel.isPlayerPresented) {
                Player()
                    .environmentObject(viewModel)
            }
            
        }
    }
}

#Preview {
    Home()
        .environmentObject(PodcastViewModel())
}
