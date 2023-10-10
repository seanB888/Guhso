//
//  Login.swift
//  RadioNuevo
//
//  Created by SEAN BLAKE on 10/9/23.
//

import SwiftUI

struct Login: View {
    @State var emailAddress = ""
    @State var password = ""
    var body: some View {
        Text("Login")
            .font(.system(size: 65, weight: .black, design: .monospaced))
        
        VStack(spacing: 10) {
            Group {
                HStack {
                    Image(systemName: "envelope")
                        .foregroundStyle(Color.theme.dark).font(.headline)
                    TextField("Email", text: $emailAddress)
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.theme.dark, lineWidth: 1))
                .padding()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    Login()
}
