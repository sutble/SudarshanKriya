//
//  InfoViewController.swift
//  SudarshanKriya
//
//  Created by Aditya Garg on 2/25/17.
//
//

import UIKit
import AVFoundation


class InfoViewController: UIViewController {

    @IBOutlet weak var XButton: UIButton!
     //var playerRef: AVAudioPlayer!
    @IBOutlet weak var textView: UITextView!
    //var descriptionText : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        XButton.layer.cornerRadius = XButton.frame.size.width/2
        //textView.text = descriptionText
        //print(descriptionText)
    }
    
    @IBAction func dismiss(_ sender: AnyObject) {
       // playerRef.play()
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
