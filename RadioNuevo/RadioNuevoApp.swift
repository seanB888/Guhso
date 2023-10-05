//
//  RadioNuevoApp.swift
//  RadioNuevo
//
//  Created by SEAN BLAKE on 10/4/23.
//

import SwiftUI

@main
struct RadioNuevoApp: App {
    @StateObject var sharedData = SharedData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(sharedData)
        }
    }
}
