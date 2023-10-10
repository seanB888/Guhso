//
//  File.swift
//  RadioNuevo
//
//  Created by SEAN BLAKE on 10/9/23.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var user: User?
    
    init() {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            self.user = user
        }
    }
    
    func logIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            // Handle result and error
        }
    }
    
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            // Handle result and error
        }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
    }
}
