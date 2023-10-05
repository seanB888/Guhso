//
//  PodcastViewModel.swift
//  RadioNuevo
//
//  Created by SEAN BLAKE on 10/4/23.
//

import Foundation

class PodcastViewModel: ObservableObject {
    @Published var podcast: Podcast?
    private var podcastParser: PodcastParser?
    
    init() {
        fetchPodcastData()
    }
    
    private func fetchPodcastData() {
        podcastParser = PodcastParser()
        podcastParser?.parse()
        
        // Observe the podcast data from the parser
        podcastParser?.$podcast.assign(to: &$podcast)
    }
}
