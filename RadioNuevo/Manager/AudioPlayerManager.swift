//
//  AudioPlayerManager.swift
//  RadioNuevo
//
//  Created by SEAN BLAKE on 10/5/23.
//

import AVFoundation

class AudioPlayerManager: ObservableObject {
    private var player: AVPlayer? {
        didSet {
            setupTimeObserver()
        }
    }
    
    @Published var isPlaying: Bool = false
    
    @Published var currentTime: TimeInterval = 0
    var duration: TimeInterval {
        return player?.currentItem?.duration.seconds ?? 0
    }
    
    private var timeObserver: Any?
    
    init() {
        setupTimeObserver()
    }
    
    deinit {
        if let observer = timeObserver {
            player?.removeTimeObserver(observer)
        }
    }
    
    private func setupTimeObserver() {
        guard let player = player else { return }
        let interval = CMTime(seconds: 0.5, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        timeObserver = player.addPeriodicTimeObserver(
            forInterval: interval,
            queue: DispatchQueue.main
        ) { [weak self] time in
            self?.currentTime = time.seconds
        }
    }
    
    func seek(to time: TimeInterval) {
        let cmTime = CMTime(seconds: time, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        player?.seek(to: cmTime, completionHandler: { _ in
            DispatchQueue.main.async {
                self.currentTime = time  // Update currentTime after seeking
            }
        })
    }
    
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
