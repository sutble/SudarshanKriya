//
//  TestVCViewController.swift
//  SudarshanKriya
//
//  Created by Aditya Garg on 1/30/17.
//  Copyright © 2017 Archetapp. All rights reserved.
//

import UIKit
import AVFoundation

class TestVCViewController: UIViewController {

    @IBOutlet weak var midView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let videoURL: NSURL = Bundle.main.url(forResource: "35secondDemo", withExtension: "mp4")! as NSURL
        print("SWAG ",videoURL, "SWAG")
        let player = AVPlayer(url: videoURL as URL)
        player.actionAtItemEnd = .none
        player.isMuted = true
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        playerLayer.zPosition = -1
        playerLayer.frame = self.view.frame
        self.view.layer.addSublayer(playerLayer)
        player.seek(to: kCMTimeZero)
        player.play()
    }

}
