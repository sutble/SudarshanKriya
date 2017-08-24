//
//  UjayiViewController.swift
//  SudarshanKriya
//
//  Created by Aditya Garg on 3/25/17.
//
//

import UIKit
import AVFoundation


class UjayiViewController: UIViewController, AVAudioPlayerDelegate {

    
    public var player: AVAudioPlayer? = AVAudioPlayer()
    var playURL : URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func playSound(_ url: URL){
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            player.delegate = self
            player.prepareToPlay()
            player.currentTime = 0.0
            player.play()
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    
    @IBAction func test(_ sender: Any) {
        playSound(Bundle.main.url(forResource: "UjayiBreath", withExtension: "mp3")!)
    }

    
}
