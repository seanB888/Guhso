//
//  RSSFeedModel.swift
//  RadioNuevo
//
//  Created by SEAN BLAKE on 10/4/23.
//

import SwiftUI

struct Podcast: Codable {
    var title: String
    var episodes: [Episode]
}

struct Episode: Codable {
    var title: String
    var pubDate: String? // Changed from String to Date
    var description: String?
    var enclosure: Enclosure?
    var author: Author? // Nested model
    
    init(title: String, pubDate: String, description: String, enclosure: Enclosure) {
        self.title = title
        self.pubDate = pubDate
        self.description = description
        self.enclosure = enclosure
    }
}

struct Enclosure: Codable {
    var url: String
    var length: String
    var type: String
    
    init(url: String, length: String, type: String) {
        self.url = url
        self.length = length
        self.type = type
    }
}

struct Author: Codable {
    var name: String
    var email: String
}

enum EpisodeStatus: String, Codable {
    case published
    case draft
    case archived
}
