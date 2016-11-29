//
//  View1.swift
//  SnapchatCamera
//
//  Created by Aditya Garg on 8/26/16.
//

import UIKit
import AVFoundation
import Darwin



class View1: UIViewController, AVAudioPlayerDelegate {
    
    enum Stages {
        
        case stage1 (Technique)
        case stage2 (Technique)
        case stage3 (Technique)
    }
    
    var listOfFuncs = Array<Stages>();
    var progressCounter = -1 //starts incrementing in beginning, so will be 0 when used
    
    var player: AVAudioPlayer? = AVAudioPlayer()
    var playURL : URL?
    var lastSound : Bool!
    
    
    let beginSound = Bundle.main.url(forResource: "begin", withExtension: "mp3")!
    let endSound = Bundle.main.url(forResource: "completedexercise", withExtension: "mp3")!


    let infoColor = UIColor.lightGray
    let highlightColor = UIColor.darkGray
    let clearColor = UIColor.clear

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
       
        UIApplication.shared.isIdleTimerDisabled = true
        lastSound = false



        listOfFuncs.append(Stages.stage1(Ujayi()))
        addRest()
        listOfFuncs.append(Stages.stage2(Ujayi()))
        addRest()
        listOfFuncs.append(Stages.stage3(Ujayi()))
        addRest()
        listOfFuncs.append(Stages.stage1(Bhastrika()))
        addRest()
        listOfFuncs.append(Stages.stage2(Bhastrika()))
        addRest()
        listOfFuncs.append(Stages.stage3(Bhastrika()))
        addAum()
        listOfFuncs.append(Stages.stage1(SudarshanKriya()))
        listOfFuncs.append(Stages.stage2(SudarshanKriya()))
        listOfFuncs.append(Stages.stage3(SudarshanKriya()))
       
        self.view.backgroundColor = infoColor
        backgroundColor(infoColor)
    
        setCircleLabel(circleOne)
        setCircleLabel(circleTwo)
        setCircleLabel(circleThree)
        
        setTextLabel(nameText,size: 55)
        setTextLabel(stageText,size: 45)
        
        hideCounter()
        
        playSound(beginSound)
        hideCounter()
    }
    
    func addRest(){
        listOfFuncs.append(Stages.stage1(Rest()))
        listOfFuncs.append(Stages.stage2(Rest()))
        listOfFuncs.append(Stages.stage3(Rest()))
    }
    
    func addAum(){
        listOfFuncs.append(Stages.stage1(Aum()))
        listOfFuncs.append(Stages.stage2(Aum()))
        listOfFuncs.append(Stages.stage3(Aum()))
    }
    
    func playSound(_ url: URL){
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            player.delegate = self
            player.prepareToPlay()
            player.play()
        } catch let error as NSError {
            print(error.description)
        }
    }

    func changeCounter(_ number : Int){
        circleOne.backgroundColor = clearColor
        circleTwo.backgroundColor = clearColor
        circleThree.backgroundColor = clearColor
        
        if(number == 1){ circleOne.backgroundColor = highlightColor}
        else if(number == 2){ circleTwo.backgroundColor = highlightColor}
        else if(number == 3){ circleThree.backgroundColor = highlightColor}
        else{print("Wrong counter number inputted (only 1,2,3)")}

    }
    
    func hideCounter(){
        circleOne.isHidden = true
        circleTwo.isHidden = true
        circleThree.isHidden = true
    }
    
    func showCounter(){
        circleOne.isHidden = false
        circleTwo.isHidden = false
        circleThree.isHidden = false
    }
    
    func backgroundColor(_ color : UIColor){
        name.backgroundColor = color
        counter.backgroundColor = color
        stage.backgroundColor = color
    }
    
    func setCircleLabel(_ circle : UILabel){
        circle.backgroundColor = clearColor
        circle.layer.cornerRadius = 35.0
        circle.clipsToBounds = true
        circle.layer.borderColor = UIColor.black.cgColor
        circle.layer.borderWidth = 2.0
        circle.textAlignment = NSTextAlignment.center
        circle.font = UIFont(name: "Azurite", size: 30)
    }
    
    func setTextLabel(_ text: UILabel, size : CGFloat){
        text.textAlignment = NSTextAlignment.center
        text.font = UIFont(name: "Azurite", size: size)
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) { // *
        showCounter()   
        progressCounter += 1
        let isIndexValid = listOfFuncs.indices.contains(progressCounter)
        if(isIndexValid){
            let t = listOfFuncs[progressCounter]
            switch t{
            case let .stage1(t):
                showCounter()
                changeCounter(1)
                nameText.text = t.name
                stageText.text = t.Stage1
                self.view.backgroundColor = t.color
                playURL = t.url1
            case let .stage2(t):
                showCounter()
                changeCounter(2)
                nameText.text = t.name
                stageText.text = t.Stage2
                self.view.backgroundColor = t.color
                playURL = t.url2
            case let .stage3(t):
                showCounter()
                changeCounter(3)
                nameText.text = t.name
                stageText.text = t.Stage3
                self.view.backgroundColor = t.color
                playURL = t.url3
                
            default:
                print("No Technique with that name")
            }
            playSound(playURL!)
        }
        else if (!self.lastSound){
            hideCounter()
            nameText.text = "Finished"
            stageText.text = ""
            self.playSound(endSound) //plays end sound
            self.lastSound = true
            hideCounter()
        }

        
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


