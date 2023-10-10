//
//  FirestoreManager.swift
//  RadioNuevo
//
//  Created by SEAN BLAKE on 10/9/23.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class FirestoreManager: ObservableObject {
    private var db = Firestore.firestore()
    
    @Published var favorites: [Favorite] = []
    
    func fetchFavorites(for userId: String) {
        db.collection("favorites")
            .whereField("userId", isEqualTo: userId)
            .addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents: \(error!)")
                    return
                }
                
                self.favorites = documents.compactMap { queryDocumentSnapshot in
                    try? queryDocumentSnapshot.data(as: Favorite.self)
                }
            }
    }
    
    func addFavorite(_ favorite: Favorite) {
        do {
            var userFavorite = favorite
            let _ = try db.collection("favorites").addDocument(from: userFavorite) { error in
                if let error = error {
                    print("Error adding document: \(error.localizedDescription)")
                } else {
                    print("Document added with ID: \(userFavorite.id ?? "")")
                }
            }
        } catch {
            print(error)
        }
    }
    
    func removeFavorite(_ favorite: Favorite) {
        if let favoriteId = favorite.id {
            db.collection("favorites").document(favoriteId).delete { error in
                if let error = error {
                    print("Error removing document: \(error)")
                } else {
                    print("Document successfully removed!")
                }
            }
        }
    }
}

