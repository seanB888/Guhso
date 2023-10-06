//
//  PodcastViewModel.swift
//  RadioNuevo
//
//  Created by SEAN BLAKE on 10/4/23.
//

import Foundation

class PodcastViewModel: ObservableObject {
    @Published var podcast: Podcast?
    @Published var selectedEpisode: Episode?
    @Published var isPlayerPresented: Bool = false
    private var podcastParser: PodcastParser?
    var audioPlayerManager = AudioPlayerManager()
    
    init() {
        fetchPodcastData()
    }
    
    func selectEpisode(_ episode: Episode) {
        selectedEpisode = episode
        audioPlayerManager.stopPlayback() // Stop any currently playing episode
    }
    
    func fetchPodcastData() {
        
        podcastParser = PodcastParser()
        podcastParser?.parse()
        
        // Observe the podcast data from the parser
        podcastParser?.$podcast.assign(to: &$podcast)
    }
}
