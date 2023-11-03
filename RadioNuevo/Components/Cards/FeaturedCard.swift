//
//  FeaturedCrad.swift
//  RadioNuevo
//
//  Created by SEAN BLAKE on 10/12/23.
//

import SwiftUI

struct FeaturedCard: View {
    let action: () -> Void
    var showTitle: String
    var showEpisode: Int
    var showDate: Date
    @State var isPlaying: Bool
    var imageName: String
    
    private let gradient = Gradient(colors: [.clear, .white.opacity(0.5)])
    private let cornerRadius: CGFloat = 24.0
    private let imageScaleFactor: CGFloat = 1.3
    
    var body: some View {
        VStack {
            GeometryReader { proxy in
                ZStack(alignment: .bottom) {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(cornerRadius)
                        .frame(height: proxy.size.width / imageScaleFactor)
                    
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(gradient)
                        .cornerRadius(24)
                        .frame(height: proxy.size.width / imageScaleFactor)
                        .offset(y: 45)
                    
                    HStack {
                        PlayButton(
                            action: { action() },
                            imageName: isPlaying ? "pause.fill" : "play.fill",
                            buttonColor: Color.theme.brand,
                            imageColor: Color.theme.background)
                        
                        VStack(alignment: .leading) {
                            Text(showTitle)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.theme.brand)
                                .lineLimit(1)
                            
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
    }
}

#Preview {
    FeaturedCard(action: {}, showTitle: "Tea or Not to Tea", showEpisode: 4, showDate: Date(), isPlaying: false, imageName: "logo2")
}
