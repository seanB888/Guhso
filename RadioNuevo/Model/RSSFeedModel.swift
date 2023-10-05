//
//  RSSFeedModel.swift
//  RadioNuevo
//
//  Created by SEAN BLAKE on 10/4/23.
//

import Foundation

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
}

struct Enclosure: Codable {
    var url: String
    var length: String
    var type: String
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
