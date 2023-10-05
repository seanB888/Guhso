//
//  SharedData.swift
//  RadioNuevo
//
//  Created by SEAN BLAKE on 10/5/23.
//

import Foundation

class SharedData: ObservableObject {
    @Published var podcast: Podcast?
    @Published var episode: Episode?
    @Published var episodeStatus: EpisodeStatus?
}
