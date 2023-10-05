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
    var pubDate: Date? // Changed from String to Date
    var description: String?
    var enclosure: Enclosure?
    var author: Author? // Nested model
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        enclosure = try container.decodeIfPresent(Enclosure.self, forKey: .enclosure)
        author = try container.decodeIfPresent(Author.self, forKey: .author)
        
        // Convert pubDate string to Date
        let pubDateString = try container.decodeIfPresent(String.self, forKey: .pubDate)
        if let dateString = pubDateString {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d MMM yyyy"
            pubDate = dateFormatter.date(from: dateString)
        } else {
            pubDate = nil
        }
    }
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
