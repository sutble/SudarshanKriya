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
import SceneKit
import SpriteKit



class DailyKriya: UIViewController, AVAudioPlayerDelegate {
    
    var ref: FIRDatabaseReference?
    var databaseHandle:FIRDatabaseHandle?
    
    var masterList = Array<Technique>()
    
    var progressCounter = -1 //starts incrementing in beginning, so will be 0 when used
    
    var restTime = 20
    var seconds = 0 //will initialize later
    var timer = Timer()
    
    
    var player: AVAudioPlayer? = AVAudioPlayer()
    var playURL : URL?
    var lastSound : Bool!
    
    
    let beginSound = Bundle.main.url(forResource: "begin", withExtension: "mp3")!
    let endSound = Bundle.main.url(forResource: "transition", withExtension: "mp3")!


    let infoColor = UIColor.gray
    let highlightColor = UIColor.darkGray
    let clearColor = UIColor.clear
    
    var Kriy : KriyScene?
    
    //MARK: - IBOutlets
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var counter: UIView!
    @IBOutlet weak var animationView: SKView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var circleOne: UILabel!
    @IBOutlet weak var circleTwo: UILabel!
    @IBOutlet weak var circleThree: UILabel!
    
    
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var timerText: UILabel!
    
    
    @IBAction func pause(_ sender: AnyObject) {
        if (player?.isPlaying)! {
            player?.pause()
            Kriy?.isPaused = true
            let play = UIImage(named: "play.png")
            playButton.contentMode = .scaleToFill
            playButton.contentVerticalAlignment = UIControlContentVerticalAlignment.bottom

            playButton.setBackgroundImage(play, for: .normal)
            //playButton.fram
        } else {
            self.player?.play()
            Kriy?.isPaused = false
            let pause = UIImage(named: "pause.png")
            playButton.setBackgroundImage(pause, for: .normal)
        }
    }
    

    //MARK: - viewDidLoad
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        animationView.alpha = 0 //CHANGE
        hideButton()
        UIApplication.shared.isIdleTimerDisabled = true
        lastSound = false
        seconds = restTime

        ref = FIRDatabase.database().reference()
        makeList()

        self.view.backgroundColor = infoColor
        backgroundColor(infoColor)
        roundCorners()  
    
        setCircleLabel(circleOne)
        setCircleLabel(circleTwo)
        setCircleLabel(circleThree)
        
        setTextLabel(nameText,size: 55)
        setTextLabel(timerText, size: 45)
        
        let pause = UIImage(named: "pause.png")
        playButton.setBackgroundImage(pause, for: .normal)
        
        hideCounter()
        hideTimer()
        hideButton()
        playSound(beginSound)
        hideCounter()
    }
    
 
    
    //MARK: - Master List
    
    func makeList(){
        
        let ujayiColor = UIColor(red: 69/255, green: 173/255, blue: 168/255, alpha: 1)
        let restColor = UIColor(red: 157/255, green: 224/255, blue: 173/255, alpha: 1)
        let bhastrikaColor = UIColor(red: 232/255, green: 74/255, blue: 95/255, alpha: 1)
        let aumColor = UIColor(red: 84/255, green: 121/255, blue: 128/255, alpha: 1)
        let kriyaColor = UIColor(red: 42/255, green: 54/255, blue: 59/255, alpha: 1)
        
        
        //Ujayi Stage 1
        masterList.append(Technique(name: "Ujayi Breath", color: ujayiColor , stage: 1, scene: "Waist.png", url: getURL(string: "UjayiBreath")))
        //Rest
        masterList.append(Technique(name: "Rest", color: restColor, stage: 0, scene: "Rest.png", url: getURL(string: "restTransition"))) //need to make custom scenes for the various rest transitions, and combine them all in 1 URL
        //Ujayi Stage 2
        masterList.append(Technique(name: "Ujayi Breath", color: ujayiColor, stage: 2, scene: "Chest.png", url: getURL(string: "UjayiBreath")))
        //Rest
        masterList.append(Technique(name: "Rest", color: restColor, stage: 0, scene: "Rest.png", url: getURL(string: "restTransition")))
        //Ujayi Stage 3
        masterList.append(Technique(name: "Ujayi Breath", color: ujayiColor, stage: 3, scene: "Back.png", url: getURL(string: "UjayiBreath")))
        //Rest
        masterList.append(Technique(name: "Rest", color: restColor, stage: 0, scene: "Rest.png", url: getURL(string: "restTransition")))
        //Bhastrika
        masterList.append(Technique(name: "Bhastrika", color: bhastrikaColor , stage: 1, scene: "Bhastrika.png", url: getURL(string: "bhastrikafinal")))
        //Rest
        masterList.append(Technique(name: "Rest", color: restColor, stage: 0, scene: "Rest.png", url: getURL(string: "restTransition")))
        //Bhastrika
        masterList.append(Technique(name: "Bhastrika", color: bhastrikaColor, stage: 2, scene: "Bhastrika.png", url: getURL(string: "bhastrikafinal")))
        //Rest
        masterList.append(Technique(name: "Rest", color: restColor, stage: 0, scene: "Rest.png", url: getURL(string: "restTransition")))
        //Bhastrika
        masterList.append(Technique(name: "Bhastrika", color: bhastrikaColor, stage: 3, scene: "Bhastrika.png", url: getURL(string: "bhastrikafinal")))
 
        //Aum
        masterList.append(Technique(name: "Aum", color: aumColor, stage: 1, scene: "Aum.png", url: getURL(string: "aum1")))
        masterList.append(Technique(name: "Aum", color: aumColor, stage: 2, scene: "Aum.png", url: getURL(string: "aum2")))
        masterList.append(Technique(name: "Aum", color: aumColor, stage: 3, scene: "Aum.png", url: getURL(string: "aum2")))
        //Sudarshan Kriya
        masterList.append(Technique(name: "Sudarshan Kriya", color: kriyaColor, stage: 1, scene: "Kriya.png", url: getURL(string: "SriSoham")))
        masterList.append(Technique(name: "Sudarshan Kriya", color: kriyaColor, stage: 2, scene: "Kriya.png", url: getURL(string: "SriSoham")))
        masterList.append(Technique(name: "Sudarshan Kriya", color: kriyaColor, stage: 3, scene: "Kriya.png", url: getURL(string: "SriSoham")))
    }
    
    /*
    func makeList(){
        
        let ujayiColor = UIColor(red: 69/255, green: 173/255, blue: 168/255, alpha: 1)
        let restColor = UIColor(red: 157/255, green: 224/255, blue: 173/255, alpha: 1)
        let bhastrikaColor = UIColor(red: 232/255, green: 74/255, blue: 95/255, alpha: 1)
        let aumColor = UIColor(red: 84/255, green: 121/255, blue: 128/255, alpha: 1)
        let kriyaColor = UIColor(red: 42/255, green: 54/255, blue: 59/255, alpha: 1)
        
        
        //Ujayi Stage 1
       masterList.append(Technique(name: "Ujayi Breath", color: ujayiColor , stage: 1, scene: "UjayiWaistAnimation", url: getURL(string: "UjayiBreath")))
        //Rest
         masterList.append(Technique(name: "Rest", color: restColor, stage: 0, scene: "35secondemo", url: getURL(string: "restTransition"))) //need to make custom scenes for the various rest transitions, and combine them all in 1 URL
        //Ujayi Stage 2
         masterList.append(Technique(name: "Ujayi Breath", color: ujayiColor, stage: 2, scene: "35secondemo", url: getURL(string: "UjayiBreath")))
        //Rest
         masterList.append(Technique(name: "Rest", color: restColor, stage: 0, scene: "35secondemo", url: getURL(string: "transition")))
        //Ujayi Stage 3
         masterList.append(Technique(name: "Ujayi Breath", color: ujayiColor, stage: 3, scene: "35secondemo", url: getURL(string: "UjayiBreath")))
        //Rest
         masterList.append(Technique(name: "Rest", color: restColor, stage: 0, scene: "35secondemo", url: getURL(string: "transition")))
        //Bhastrika
        masterList.append(Technique(name: "Bhastrika", color: bhastrikaColor , stage: 1, scene: "35secondemo", url: getURL(string: "bhastrikafinal")))
        //Rest
        masterList.append(Technique(name: "Rest", color: restColor, stage: 0, scene: "35secondemo", url: getURL(string: "transition")))
        //Bhastrika
        masterList.append(Technique(name: "Bhastrika", color: bhastrikaColor, stage: 2, scene: "35secondemo", url: getURL(string: "bhastrikafinal")))
        //Rest
        masterList.append(Technique(name: "Rest", color: restColor, stage: 0, scene: "35secondemo", url: getURL(string: "transition")))
        //Bhastrika
        masterList.append(Technique(name: "Bhastrika", color: bhastrikaColor, stage: 3, scene: "35secondemo", url: getURL(string: "bhastrikafinal")))
        //Aum
        masterList.append(Technique(name: "Aum", color: aumColor, stage: 1, scene: "35secondemo", url: getURL(string: "aum1")))
        masterList.append(Technique(name: "Aum", color: aumColor, stage: 2, scene: "35secondemo", url: getURL(string: "aum2")))
        masterList.append(Technique(name: "Aum", color: aumColor, stage: 3, scene: "35secondemo", url: getURL(string: "aum2")))
        //Sudarshan Kriya
        masterList.append(Technique(name: "Sudarshan Kriya", color: kriyaColor, stage: 1, scene: "35secondemo", url: getURL(string: "SriSoham")))
        masterList.append(Technique(name: "Sudarshan Kriya", color: kriyaColor, stage: 2, scene: "35secondemo", url: getURL(string: "SriSoham")))
        masterList.append(Technique(name: "Sudarshan Kriya", color: kriyaColor, stage: 3, scene: "35secondemo", url: getURL(string: "SriSoham")))
    }
    */
    
    func getURL(string: String) -> URL{
        return Bundle.main.url(forResource: string, withExtension: "mp3")!
    }
    
    //MARK: - UI

    func changeCounter(_ number : Int){
        circleOne.backgroundColor = clearColor
        circleTwo.backgroundColor = clearColor
        circleThree.backgroundColor = clearColor
        
        if(number == 0){
            hideCounter()
            showTimer()
            startTimer()
        }
        else if(number == 1){
            showCounter()
            hideTimer()
            circleOne.backgroundColor = highlightColor
        }
        else if(number == 2){
            showCounter()
            hideTimer()
            circleTwo.backgroundColor = highlightColor
        }
        else if(number == 3){
            showCounter()
            hideTimer()
            circleThree.backgroundColor = highlightColor
        }
        else{
            print("Wrong counter number inputted (only 0,1,2,3)")
        }
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
        self.view.backgroundColor = color
        counter.backgroundColor = color
        //animationView.backgroundColor = color //CHANGE
        //Kriy?.backgroundColor = color
        imageView.backgroundColor = color
    }
    
    func roundCorners(){
        counter.layer.cornerRadius = 10
        counter.clipsToBounds = true
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
    
    func showButton(){
        playButton.alpha = 1
    }
    
    func hideButton(){
        playButton.alpha = 0
    }
    
    //MARK: - Sound
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) { // *
        showCounter()
        //showButton()
        progressCounter += 1
        if masterList.indices.contains(progressCounter) {
            let t = masterList[progressCounter]
            showCounter()
            hideTimer()
            changeCounter(t.stage)
            nameText.text = t.name
            //Kriy = KriyScene(size: animationView.frame.size) //CHANGE
            backgroundColor(t.color)
            playSound(t.url)
            let image = UIImage(named: t.scene)
            imageView.image = image
            imageView.contentMode = .scaleAspectFit
            //animationView.presentScene(Kriy)
            //Kriy?.start(position: animationView.center, sceneName: t.scene)
            
        }
        else if (!self.lastSound){
            //sendFirUpdate()
            hideCounter()
            nameText.text = "Finished"
            self.playSound(endSound) //plays end sound
            self.lastSound = true
            hideCounter()
        }
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
  
    //MARK: - Timer
    
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
    
    
    //MARK: - Firebase
    
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


