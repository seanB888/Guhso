//
//  ContentView.swift
//  RadioNuevo
//
//  Created by SEAN BLAKE on 10/4/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showModal: Bool = false
    
    var body: some View {
        VStack {
            Text("IT GUHSO")
                .font(.system(size: 50, weight: .black, design: .rounded))
            
            CircleButton(icon: "play.fill") {
                //
                showModal.toggle()
            }
            .sheet(isPresented: $showModal, content: {
                Player()
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
