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
        if let podcast = viewModel.podcast {
            VStack {
                Text(podcast.title)
                    .font(.system(size: 30, weight: .bold, design: .serif))
                
            }
        } else {
            Text("Loading...")
        }
    }
}

#Preview {
    Home()
        .environmentObject(PodcastViewModel())
}
