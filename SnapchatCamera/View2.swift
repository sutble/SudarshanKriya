//
//  View2.swift
//  SnapchatCamera
//
//  Created by Jared Davidson on 8/26/15.
//  Copyright (c) 2015 Archetapp. All rights reserved.
//

import UIKit


class View2: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "instructions.jpg")
        self.view.insertSubview(backgroundImage, at: 0)
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "instructions.jpg")!)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
