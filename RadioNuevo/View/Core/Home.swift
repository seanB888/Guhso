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
        List(viewModel.podcast?.episodes ?? [], id: \.title) { episode in
            Button(action: {
                viewModel.selectedEpisode(episode)
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

#Preview {
    Home()
        .environmentObject(PodcastViewModel())
}
