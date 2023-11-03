//
//  Navbar.swift
//  RadioNuevo
//
//  Created by SEAN BLAKE on 11/3/23.
//

import SwiftUI

struct Navbar: View {
    var body: some View {
        HStack {
            CircleButton(icon: "square.grid.2x2.fill", action: {}, foregroundColor: Color.theme.brand, iconSize: 30)
            Spacer()
            Text("Bare Vibez")
                .fontWeight(.bold)
            Spacer()
            CircleButton(icon: "magnifyingglass", action: {}, foregroundColor: Color.theme.brand, iconSize: 30)
        }
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .foregroundStyle(Color.theme.brand)
        .background(Color.theme.background)
    }
}

#Preview {
    Navbar()
}
