//
//  AppUser.swift
//  RadioNuevo
//
//  Created by SEAN BLAKE on 10/9/23.
//

import FirebaseFirestoreSwift

struct Favorite: Identifiable, Codable {
    @DocumentID var id: String?
    var episodeTitle: String
    var episodeDescription: String
    var episodeUrl: String
    var userId: String  // To link the favorite episode to a specific user
    
    enum CodingKeys: String, CodingKey {
        case id
        case episodeTitle
        case episodeDescription
        case episodeUrl
        case userId
    }
}
