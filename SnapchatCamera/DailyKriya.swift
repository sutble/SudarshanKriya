//
//  View1.swift
//  SnapchatCamera
//
//  Created by Aditya Garg on 8/26/16.
//

import UIKit
import AVFoundation
import Darwin
import FirebaseDatabase
import AVFoundation



class DailyKriya: UIViewController, AVAudioPlayerDelegate {
    
    var ref: FIRDatabaseReference?
    var databaseHandle:FIRDatabaseHandle?
    
    enum Stages {
        
        case stage1 (Technique)
        case stage2 (Technique)
        case stage3 (Technique)
        case rest (Technique)
    }
    
    var listOfFuncs = Array<Stages>();
    var progressCounter = -1 //starts incrementing in beginning, so will be 0 when used
    
    var restTime = 20
    var seconds = 0 //will initialize later
    var timer = Timer()
    
    
    var player: AVAudioPlayer? = AVAudioPlayer()
    var playURL : URL?
    var lastSound : Bool!
    
    
    let beginSound = Bundle.main.url(forResource: "begin", withExtension: "mp3")!
    let endSound = Bundle.main.url(forResource: "transition", withExtension: "mp3")!


    let infoColor = UIColor.lightGray
    let highlightColor = UIColor.darkGray
    let clearColor = UIColor.clear

    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var counter: UIView!
    @IBOutlet weak var name: UIView!
    @IBOutlet weak var stage: UIView!
    
    @IBOutlet weak var circleOne: UILabel!
    @IBOutlet weak var circleTwo: UILabel!
    @IBOutlet weak var circleThree: UILabel!
    
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var stageText: UILabel!
    @IBOutlet weak var timerText: UILabel!
    
    
    @IBAction func pause(_ sender: AnyObject) {
        if (player?.isPlaying)! {
            player?.pause()
            let play = UIImage(named: "play.png")
            playButton.contentMode = .scaleToFill
            playButton.contentVerticalAlignment = UIControlContentVerticalAlignment.bottom

            playButton.setBackgroundImage(play, for: .normal)
            //playButton.fram
        } else {
            self.player?.play()
            
            let pause = UIImage(named: "pause.png")
            playButton.setBackgroundImage(pause, for: .normal)
        }
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        UIApplication.shared.isIdleTimerDisabled = true
        lastSound = false
        seconds = restTime

        
        ref = FIRDatabase.database().reference()


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
        addRest()
        addAum()
        listOfFuncs.append(Stages.stage1(SudarshanKriya()))
        listOfFuncs.append(Stages.stage2(SudarshanKriya()))
        listOfFuncs.append(Stages.stage3(SudarshanKriya()))
        
       
        self.view.backgroundColor = infoColor
        backgroundColor(infoColor)
        roundCorners()  
    
        setCircleLabel(circleOne)
        setCircleLabel(circleTwo)
        setCircleLabel(circleThree)
        
        setTextLabel(nameText,size: 55)
        setTextLabel(stageText,size: 45)
        setTextLabel(timerText, size: 45)
        
        let pause = UIImage(named: "pause.png")
        playButton.setBackgroundImage(pause, for: .normal)
        
        hideCounter()
        hideTimer()
        hideButton()
        playSound(beginSound)
        hideCounter()
    }
    
    func addRest(){
        listOfFuncs.append(Stages.rest(Rest()))
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
    
    func roundCorners(){
        
        counter.layer.cornerRadius = 10
        name.layer.cornerRadius = 10
        stage.layer.cornerRadius = 10
        counter.clipsToBounds = true
        name.clipsToBounds = true
        stage.clipsToBounds = true
        
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
        showButton()
        progressCounter += 1
        let isIndexValid = listOfFuncs.indices.contains(progressCounter)
        if(isIndexValid){
            let t = listOfFuncs[progressCounter]
            switch t{
            case let .stage1(t):
                showCounter()
                hideTimer()
                changeCounter(1)
                nameText.text = t.name
                stageText.text = t.Stage1
                self.view.backgroundColor = t.color
                playURL = t.url1
            case let .stage2(t):
                showCounter()
                hideTimer()
                changeCounter(2)
                nameText.text = t.name
                stageText.text = t.Stage2
                self.view.backgroundColor = t.color
                playURL = t.url2
            case let .stage3(t):
                showCounter()
                hideTimer()
                changeCounter(3)
                nameText.text = t.name
                stageText.text = t.Stage3
                self.view.backgroundColor = t.color
                playURL = t.url3
            case let .rest(t):
                hideCounter()
                showTimer()
                startTimer()
                nameText.text = t.name
                stageText.text = "Blow Nose/Drink Water"
                self.view.backgroundColor = t.color
                playURL = t.url2
                
            default:
                print("No Technique with that name")
            }
            playSound(playURL!)
        }
        else if (!self.lastSound){
            //sendFirUpdate()
            hideCounter()
            nameText.text = "Finished"
            stageText.text = ""
            self.playSound(endSound) //plays end sound
            self.lastSound = true
            hideCounter()
        }

        
    }
    
    func showTimer(){
        timerText.alpha = 1
    }
    
    func hideTimer(){
        timerText.alpha = 0
    }
    
    func startTimer(){
        timerText.text = String(seconds) + " Seconds"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(DailyKriya.restCounter), userInfo: nil, repeats: true)
    }
    
    func restCounter(){
        seconds -= 1
        timerText.text = String(seconds) + " Seconds"
        
        if seconds == 0{
            timer.invalidate()
            seconds = restTime
        }
    }
    
    func showButton(){
        playButton.alpha = 1
    }
    
    func hideButton(){
        playButton.alpha = 0
    }
    
    func sendFirUpdate(){
         ref?.child(stringDate()).child("Mind").child("Habits").child("Meditated").setValue("YES")
    }
    
    func stringDate() -> String{
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents(in: .current, from: Date())
        
        let year =  components.year
        let month = components.month
        let day = components.day
        
        var monthString = ""
        var dayString = ""
        
        if (day! < 10){
            dayString = "0\(day!)"
        }
        else{
            dayString = "\(day!)"
        }
        if (month! < 10){
            monthString = "0\(month!)"
        }
        else{
            monthString = "\(month!)"
        }
        return monthString + ":" + dayString + ":" + "\(year!)"
    }

    
    
    

   

}


