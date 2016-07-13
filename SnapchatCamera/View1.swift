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
    
    var listOfFuncs = Array<Stages>();
    
    var player: AVAudioPlayer?
    let breatheIN = NSBundle.mainBundle().URLForResource("breatheinfinal", withExtension: "mp3")!
    let breatheOUT = NSBundle.mainBundle().URLForResource("breatheout", withExtension: "mp3")!

    let infoColor = UIColor.lightGrayColor()
    let highlightColor = UIColor.darkGrayColor()
    let clearColor = UIColor.clearColor()

    @IBOutlet weak var counter: UIView!
    @IBOutlet weak var name: UIView!
    @IBOutlet weak var stage: UIView!
    
    @IBOutlet weak var circleOne: UILabel!
    @IBOutlet weak var circleTwo: UILabel!
    @IBOutlet weak var circleThree: UILabel!
    
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var stageText: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        listOfFuncs.append(Stages.Stage1(Ujayi()))
        listOfFuncs.append(Stages.Stage2(Bhastrika()))
        
        backgroundColor(infoColor)
    
        setCircleLabel(circleOne)
        setCircleLabel(circleTwo)
        setCircleLabel(circleThree)
        
        setTextLabel(nameText,size: 55)
        setTextLabel(stageText,size: 45)
        
        for t in listOfFuncs {
            
            switch t{
            case let .Stage1(t):
                changeCounter(1)
                nameText.text = t.name
                stageText.text = t.Stage1
                self.view.backgroundColor = t.color
                t.function(t.repitition)
            case let .Stage2(t):
                changeCounter(2)
                nameText.text = t.name
                stageText.text = t.Stage2
                self.view.backgroundColor = t.color
                t.function(t.repitition)
            case let .Stage3(t):
                changeCounter(3)
                nameText.text = t.name
                stageText.text = t.Stage3
                self.view.backgroundColor = t.color
                t.function(t.repitition)
                
            default:
                print("No Technique with that name")
            }
        }
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

    func ujayiSet(counter: Int, name: String, stage: String){ //Time stufff
        playSound(breatheIN)
        let delay = 8 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue()) {
            self.playSound(self.breatheOUT)
            
        }
        
    
    }
    
    
    
    func doSet(currentSet: (counter: Int, name: String, stage: String) -> Void){
//        funcs[i](counter: 2, name: "Ujayi Breath", stage: "Waist")
//        i = i + 1
//        if(funcs.indices.contains(i)){
//            doSet(funcs[i])
//        }
//        else{print("done " + String(i))}
    }
    
    func changeCounter(number : Int){
        circleOne.backgroundColor = clearColor
        circleTwo.backgroundColor = clearColor
        circleThree.backgroundColor = clearColor
        
        if(number == 1){ circleOne.backgroundColor = highlightColor}
        else if(number == 2){ circleTwo.backgroundColor = highlightColor}
        else if(number == 3){ circleThree.backgroundColor = highlightColor}
        else{print("Wrong counter number inputted (only 1,2,3)")}

    }
    
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
    
    func backgroundColor(color : UIColor){
        name.backgroundColor = color
        counter.backgroundColor = color
        stage.backgroundColor = color
    }
    
    func setCircleLabel(circle : UILabel){
        circle.backgroundColor = clearColor
        circle.layer.cornerRadius = 35.0
        circle.clipsToBounds = true
        circle.layer.borderColor = UIColor.blackColor().CGColor
        circle.layer.borderWidth = 2.0
        circle.textAlignment = NSTextAlignment.Center
        circle.font = UIFont(name: "Azurite", size: 30)
    }
    
    func setTextLabel(text: UILabel, size : CGFloat){
        text.textAlignment = NSTextAlignment.Center
        text.font = UIFont(name: "Azurite", size: size)
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


