//
//  View1.swift
//  SnapchatCamera
//
//  Created by Jared Davidson on 8/26/15.
//  Copyright (c) 2015 Archetapp. All rights reserved.
//

import UIKit
import AVFoundation
import Darwin



class View1: UIViewController {
    
    
    enum Stages {
        
        case Stage1 (Technique)
        case Stage2 (Technique)
        case Stage3 (Technique)
        case RestStage(Technique)
        case OhmStage(Technique)
        
        
    }
    
    var followingSet : (() -> Void)?
    var funcs = Array<(counter: Int, name: String, stage: String) -> Void>()
    var i = 0

    
    var player: AVAudioPlayer?
    let breatheIN = NSBundle.mainBundle().URLForResource("breatheinfinal", withExtension: "mp3")!
    let breatheOUT = NSBundle.mainBundle().URLForResource("breatheout", withExtension: "mp3")!
    
    let ujayiColor = UIColor(red: 81/255, green: 163/255, blue: 157/255, alpha: 1)
    let bellowsColor = UIColor(red: 129/255, green: 67/255, blue: 116/255, alpha: 1)
    let kriyaColor = UIColor(red: 6/255, green: 66/255, blue: 92/255, alpha: 1)
    let infoColor = UIColor.lightGrayColor()
    
    
    @IBOutlet weak var counter: UIView!
    @IBOutlet weak var name: UIView!
    @IBOutlet weak var stage: UIView!
    
    @IBOutlet weak var circleOne: UILabel!
    @IBOutlet weak var circleTwo: UILabel!
    @IBOutlet weak var circleThree: UILabel!
    
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var stageText: UILabel!
    
    override func viewDidLoad() {
        
//        funcs.append(bellowsSet)
//        funcs.append(kriyaSet)
//        funcs.append(bellowsSet)
        
        funcs.append(ujayiSet)
        funcs.append(ujayiSet)
        
        super.viewDidLoad()
        self.view.backgroundColor = ujayiColor //TEMPORARY
        
        name.backgroundColor = infoColor
        counter.backgroundColor = infoColor
        stage.backgroundColor = infoColor


        //circleOneLabel
        circleOne.backgroundColor = UIColor.darkGrayColor()
        circleOne.layer.cornerRadius = 35.0
        circleOne.clipsToBounds = true
        circleOne.layer.borderColor = UIColor.blackColor().CGColor
        circleOne.layer.borderWidth = 2.0
        circleOne.textAlignment = NSTextAlignment.Center
        circleOne.font = UIFont(name: "Azurite", size: 30)
        
        //circleTwoLabel
        circleTwo.backgroundColor = UIColor.clearColor()
        circleTwo.layer.cornerRadius = 35.0
        circleTwo.clipsToBounds = true
        circleTwo.layer.borderColor = UIColor.blackColor().CGColor
        circleTwo.layer.borderWidth = 2.0
        circleTwo.textAlignment = NSTextAlignment.Center
        circleTwo.font = UIFont(name: "Azurite", size: 30)
        
        //circleThreeLabel
        circleThree.backgroundColor = UIColor.clearColor()
        circleThree.layer.cornerRadius = 35.0
        circleThree.clipsToBounds = true
        circleThree.layer.borderColor = UIColor.blackColor().CGColor
        circleThree.layer.borderWidth = 2.0
        circleThree.textAlignment = NSTextAlignment.Center
        circleThree.font = UIFont(name: "Azurite", size: 30)
        
        nameText.textAlignment = NSTextAlignment.Center
        nameText.font = UIFont(name: "Azurite", size: 55)
        nameText.text = "Ujayi Breath"
        
        stageText.textAlignment = NSTextAlignment.Center
        stageText.font = UIFont(name: "Azurite", size: 45)
        stageText.text = "Breast"
        
        
        
       
        //doSet2(funcs[i])
        doSet(funcs[i])
    }
    
    func playSound(url: NSURL){
        
        do {
            player = try AVAudioPlayer(contentsOfURL: url)
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.play()
        } catch let error as NSError {
            print(error.description)
        }
    }

    func ujayiSet(counter: Int, name: String, stage: String){
        playSound(breatheIN)
        let delay = 8 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue()) {
            self.playSound(self.breatheOUT)
            
        }
        
    
    }
    func bellowsSet(){playSound(breatheIN); print("zero")}
    func kriyaSet(){playSound(breatheOUT); print("one")}
    
    func doSet2(currentSet: (counter: Int, name: String, stage: String) -> Void) {
        
        currentSet(counter: 2, name: "Ujayi Breath", stage: "Waist")
        sleep(5)
       // delay(5)
        i = i + 1
        let isIndexValid = funcs.indices.contains(i)
        if(isIndexValid){
            doSet2(funcs[i])
        }
        else{print("done" + String(i))}
        
    }
    
    func doSet(currentSet: (counter: Int, name: String, stage: String) -> Void){
        funcs[i](counter: 2, name: "Ujayi Breath", stage: "Waist")
        i = i + 1
        if(funcs.indices.contains(i)){
            doSet(funcs[i])
        }
        else{print("done " + String(i))}
    }
    
    func changeCounter(number : Int){}
    
    func hideCounter(){
        circleOne.hidden = true
        circleTwo.hidden = true
        circleThree.hidden = true
    }
    
    func showCounter(){
        circleOne.hidden = false
        circleTwo.hidden = false
        circleThree.hidden = false
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


