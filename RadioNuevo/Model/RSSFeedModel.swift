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
    var pubDate: String
    var description: String
    var enclosure: Enclosure
}

struct Enclosure: Codable {
    var url: String
    var length: String
    var type: String
}
