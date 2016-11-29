//
//  ViewController.swift
//  SnapchatCamera
//
//  Created by Jared Davidson on 8/26/15.
//  Copyright (c) 2015 Archetapp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.black
        
        let display : View1 = View1(nibName: "View1", bundle: nil)
        let instructions : View2 = View2(nibName: "View2", bundle: nil)
        let settings : View3 = View3(nibName: "View3", bundle: nil)
        
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.showsVerticalScrollIndicator = false
        
        self.addChildViewController(display)
        self.scrollView.addSubview(display.view)
        display.didMove(toParentViewController: self)
        
        self.addChildViewController(instructions)
        self.scrollView.addSubview(instructions.view)
        instructions.didMove(toParentViewController: self)
        
//        self.addChildViewController(settings)
//        self.scrollView.addSubview(settings.view)
//        settings.didMoveToParentViewController(self)
        
        var instructionsFrame : CGRect = instructions.view.frame
        instructionsFrame.origin.x = self.view.frame.width
        instructions.view.frame = instructionsFrame
        
//        var settingsFrame : CGRect = settings.view.frame
//        settingsFrame.origin.x = self.view.frame.width * 2
//        settings.view.frame = settingsFrame
        
        self.scrollView.contentSize = CGSize(width: self.view.frame.width * 2, height: self.view.frame.height) // MAKE SURE TO CHANGE THIS TO THREE WHEN YOU WANT TO ADD MORE
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

