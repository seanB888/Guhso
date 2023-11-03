//
//  EpisodeStripCard.swift
//  RadioNuevo
//
//  Created by SEAN BLAKE on 11/1/23.
//

import SwiftUI

struct EpisodeStripCard: View {
    @State private var isPlaying: Bool = false
    @State var textTitle: String = "Wha Gwaan Sean Storm"
    @State var textDescription: String = "When the temperature feature is turned on, your speaker displays thetemperature in Celsius or Fahrenheit based on the temperature format selected in the Google app. Your speaker announces the format (Celsius or Fahrenheit). The temperature is updated every 20 to 30 minutes."
    
    var body: some View {
        HStack {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading) {
                Text(textTitle)
                    .font(.headline)
                    .lineLimit(1)
                
                Text(textDescription)
                    .font(.caption)
                    .lineLimit(2)
                    .foregroundStyle(Color.theme.background.opacity(0.5))
            }
            
            Spacer()
            
            CircleButton(icon: isPlaying ? "pause.fill" : "play.fill", action: { isPlaying.toggle() }, backgroundColor: Color.theme.brand, foregroundColor: Color.black, iconSize: 25)
            
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    EpisodeStripCard()
}
