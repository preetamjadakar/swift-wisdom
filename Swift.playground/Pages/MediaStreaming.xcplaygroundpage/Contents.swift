//: [Previous](@previous)

import Foundation
import AVFoundation

/*
 # Using AVPayerViewController
 */

if let url = movieURL {
    let player = AVPlayer(url: url )
    let playerViewController = AVPlayerViewController()
    playerViewController.showsPlaybackControls = true
    playerViewController.player = player
    self.present(playerViewController, animated: true) {
        playerViewController.player?.play()
    }
}
/*
 # Using AVPayer and AVPlayerLayer
 */
if let url = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4") {
    //2. Create AVPlayer object
    let asset = AVAsset(url: url)
    let playerItem = AVPlayerItem(asset: asset)
    let player = AVPlayer(playerItem: playerItem)
    
    //3. Create AVPlayerLayer object
    let playerLayer = AVPlayerLayer(player: player)
    playerLayer.frame = self.videoView.bounds //bounds of the view in which AVPlayer should be displayed
    playerLayer.videoGravity = .resizeAspect
    
    //4. Add playerLayer to view's layer
    self.videoView.layer.addSublayer(playerLayer)
    
    //5. Play Video
    player.play()
}


public func playVideo() {
    player?.play()
}

public func pauseVideo() {
    player?.pause()
}

player?.isMuted = true

// Fast-Forward/Rewind video
var newTime = CMTimeGetSeconds(currentTime) - seconds
player?.seek(to: CMTime(value: CMTimeValue(newTime * 1000), timescale: 1000))


// Playing videos in a Queue — Playlist USE: AVQueuePlayer
let urls = [URL]()
//Add items to urls array
var playerItems = [AVPlayerItem]()

urls.forEach { (url) in
    let asset = AVAsset(url: url)
    let playerItem = AVPlayerItem(asset: asset)
    playerItems.append(playerItem)
}

let player = AVQueuePlayer(items: playerItems)

//: [Next](@next)
