//
//  StartViewController.swift
//  SudarshanKriya
//
//  Created by Aditya Garg on 1/10/17.
//  Copyright © 2017 Archetapp. All rights reserved.
//

import UIKit
import AudioToolbox


class StartViewController: UIViewController {

    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        setupLabel()
        let lightBlue = UIColor(red: 19/255, green: 149/255, blue: 186/255, alpha: 1)
        self.view.backgroundColor = lightBlue
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupButton(){
        
        let darkBlue = UIColor(red: 13/255, green: 60/255, blue: 85/255, alpha: 1)
        let lightBlue = UIColor(red: 19/255, green: 149/255, blue: 186/255, alpha: 1)
        
        
        startButton.frame = CGRect(x: 45.0, y: 400, width: 280.0, height: 60.0)
        startButton.backgroundColor = darkBlue
        startButton.clipsToBounds = true
        startButton.setTitle("Begin", for: .normal)
        startButton.titleLabel!.font = UIFont(name: "Azurite", size: 40)
        startButton.setTitleColor(lightBlue, for: .normal)
    }
    
    func setupLabel(){
        let darkBlue = UIColor(red: 13/255, green: 60/255, blue: 85/255, alpha: 1)
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "Azurite", size: 60)
        titleLabel.textColor = darkBlue
    }
    
    func animateButton(){
        UIView.animate(withDuration: 0.1, animations: { self.startButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9) }, completion: { (finish: Bool) in UIView.animate(withDuration: 0.1, animations: { self.startButton.transform = CGAffineTransform.identity }) })
    }
    
    func successHaptic(){
        AudioServicesPlaySystemSound(1520) // Actuate `Pop` feedback (strong boom)
    }
    
    
    
    
    @IBAction func startAction(_ sender: AnyObject) {
        //Animation and feedback
        animateButton()
        successHaptic()
        self.performSegue(withIdentifier: "dailyKriya", sender: sender)
        
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
