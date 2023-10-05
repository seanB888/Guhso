//
//  CustomProgressBar.swift
//  RadioNuevo
//
//  Created by SEAN BLAKE on 10/4/23.
//

import SwiftUI

struct CustomProgressBar: View {
    @State private var circleSize: CGFloat = 12
    var currentTime: TimeInterval
    var duration: TimeInterval
    
    var body: some View {
        VStack(spacing: 5) {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    // Background
                    Rectangle()
                        .foregroundStyle(Color.theme.accent2)
                        .frame(height: 4)
                    
                    // Foreground
                    Rectangle()
                        .foregroundStyle(Color.theme.brand)
                        .frame(width: geometry.size.width * CGFloat(currentTime / duration), height: 4)
                    
                    // Draggable Circle
                    Circle()
                        .foregroundStyle(Color.theme.brand)
                        .frame(width: circleSize, height: circleSize)
                        .offset(x: geometry.size.width * CGFloat(currentTime / duration) - 5)
                        .gesture(DragGesture().onChanged { value in
                            _ = min(max(0, value.location.x / geometry.size.width * duration), duration)
                            // currentTime = newTime
                        })
                }
            }
            .frame(height: 20)
            
            // Duration Labels
            HStack {
                Text(String(format: "%.2f", currentTime))
                Spacer()
                Text(String(format: "%.2f", duration))
            }
            .font(.caption)
            .foregroundStyle(Color.theme.brand)
        }
    }
}

#Preview {
    CustomProgressBar(currentTime: 1.16, duration: 3.50)
}
