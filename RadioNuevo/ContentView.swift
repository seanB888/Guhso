//
//  ContentView.swift
//  RadioNuevo
//
//  Created by SEAN BLAKE on 10/4/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: PodcastViewModel
    @State private var showModal: Bool = false
    
    var body: some View {
        
        Home()
            .environmentObject(PodcastViewModel())
    }
}

#Preview {
    ContentView()
}
