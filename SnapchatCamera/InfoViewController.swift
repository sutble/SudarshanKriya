//
//  InfoViewController.swift
//  SudarshanKriya
//
//  Created by Aditya Garg on 2/25/17.
//
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var XButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        XButton.layer.cornerRadius = XButton.frame.size.width/2
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
