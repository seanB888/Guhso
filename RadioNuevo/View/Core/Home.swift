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
            // Navbar...
            Navbar()
            
            // Featured Card here...
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.theme.brand)
                .frame(height: 300)
            
            // Advertisement...
            VStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.theme.dark.opacity(0.5))
                    .frame(height: 100)
            }
            // Other Episodes...
            // Columns for the grid...
            let columns = [
                GridItem(.flexible(), spacing: 16),
                GridItem(.flexible(), spacing: 16)
            ]
            
            HStack {
                Text("Other Episodes")
                    .foregroundStyle(Color.theme.brand)
                Spacer()
                Text("more")
                    .font(.callout)
                    .foregroundStyle(Color.theme.accent1)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(viewModel.podcast?.episodes ?? [], id: \.title) { episode in
                        SmallEpisodeCard(showTitle: episode.title, showBackgroundColor: Color.theme.accent1, showForegroundColor: Color.theme.background)
                            .onTapGesture {
                                viewModel.selectEpisode(episode)
                                viewModel.isPlayerPresented = true
                            }
                            .sheet(isPresented: $viewModel.isPlayerPresented) {
                                Player()
                                    .environmentObject(viewModel)
                            }
                    }
                }
            }
        }
        .padding()
        .padding(.top, 35)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .ignoresSafeArea()
        .background(Color.theme.background)
    }
}

#Preview {
    Home()
        .environmentObject(PodcastViewModel())
}
