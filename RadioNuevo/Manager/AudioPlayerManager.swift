//
//  AudioPlayerManager.swift
//  RadioNuevo
//
//  Created by SEAN BLAKE on 10/5/23.
//

import AVFoundation

class AudioPlayerManager: ObservableObject {
    private var player: AVPlayer?
    
    @Published var isPlaying: Bool = false
    
    func play(url: URL) {
        if player == nil {
            player = AVPlayer(url: url)
        }
        player?.play()
        isPlaying = true
    }
    
    func pause() {
        player?.pause()
        isPlaying = false
    }
    
    func togglePlayback(url: URL) {
        isPlaying ? pause() : play(url: url)
    }
    
    func skip(by seconds: Int64) {
        guard let currentTime = player?.currentTime() else { return }
        let newTime = CMTimeAdd(currentTime, CMTimeMake(value: seconds, timescale: 1))
        player?.seek(to: newTime)
    }
}
