//
//  FeaturedCrad.swift
//  RadioNuevo
//
//  Created by SEAN BLAKE on 10/12/23.
//

import SwiftUI

struct FeaturedCrad: View {
    @State private var showTitle = "Online Dating"
    @State private var showEpisode: Int = 4
    @State private var showDate = Date()
    @State private var isPlaying: Bool = false
    private var gradient = Gradient(colors: [.clear, .white.opacity(0.5)])
    
    var body: some View {
        VStack {
            GeometryReader { proxy in
                ZStack(alignment: .bottom) {
                    Image("logo2")
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(24)
                        .frame(height: proxy.size.width / 1.3)
                    
                    RoundedRectangle(cornerRadius: 24.0)
                        .fill(gradient)
                        .cornerRadius(24)
                        .frame(height: proxy.size.width / 1.3)
                        .offset(y: 42)
                    
                    HStack {
                        PlayButton(action: { isPlaying.toggle() }, imageName: isPlaying ? "pause.fill" : "play.fill", buttonColor: Color.theme.brand, imageColor: Color.theme.background)
                        
                        VStack(alignment: .leading) {
                            Text(showTitle)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.theme.brand)
                            
                            Text("Episode: \(showEpisode)")
                                .font(.callout)
                                .foregroundStyle(Color.theme.accent1)
                            
                            Text(Date(), style: Text.DateStyle.date)
                                .font(.caption2)
                                .foregroundStyle(Color.theme.accent1)
                        }
                        .padding(.horizontal, 10)
                    }
                    .offset(y: 35)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .bottomLeading)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .padding()
    }
}

#Preview {
    FeaturedCrad()
}
