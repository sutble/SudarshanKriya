//
//  Techniques.swift
//  ArtOfLiving
//
//  Created by Aditya Garg on 7/13/16.
//  Copyright © 2016 Archetapp. All rights reserved.
//

import Foundation
import UIKit

protocol Technique{
    var name: String {get}
    var color : UIColor {get}
    var Stage1 : String {get}
    var Stage2 : String {get}
    var Stage3 : String {get}
    var url1 : URL {get}
    var url2 : URL {get}
    var url3 : URL {get}
    
}

class Ujayi : Technique {
    var name = "Ujayi Breath"
    var color = UIColor(red: 69/255, green: 173/255, blue: 168/255, alpha: 1)
    var Stage1 = "Waist"
    var Stage2 = "Chest"
    var Stage3 = "Back"
    var url1 = Bundle.main.url(forResource: "UjayiBreath", withExtension: "mp3")!
    var url2 = Bundle.main.url(forResource: "UjayiBreath", withExtension: "mp3")!
    var url3 = Bundle.main.url(forResource: "UjayiBreath", withExtension: "mp3")!
//    var url1 = Bundle.main.url(forResource: "breatheinfinal", withExtension: "mp3")!
//    var url2 = Bundle.main.url(forResource: "breatheinfinal", withExtension: "mp3")!
//    var url3 = Bundle.main.url(forResource: "breatheinfinal", withExtension: "mp3")!
}

class Bhastrika : Technique {
    
    var name = "Bhastrika"
    var color = UIColor(red: 232/255, green: 74/255, blue: 95/255, alpha: 1)
    var Stage1 = "Bellows Breath"
    var Stage2 = "Bellows Breath"
    var Stage3 = "Bellows Breath"
    var url1 = Bundle.main.url(forResource: "bhastrikafinal", withExtension: "mp3")!
    var url2 = Bundle.main.url(forResource: "bhastrikafinal", withExtension: "mp3")!
    var url3 = Bundle.main.url(forResource: "bhastrikafinal", withExtension: "mp3")!
//    var url1 = Bundle.main.url(forResource: "breatheinfinal", withExtension: "mp3")!
//    var url2 = Bundle.main.url(forResource: "breatheinfinal", withExtension: "mp3")!
//    var url3 = Bundle.main.url(forResource: "breatheinfinal", withExtension: "mp3")!
}

class SudarshanKriya : Technique {
    
    var name = "Sudarshan Kriya"
    var color = UIColor(red: 42/255, green: 54/255, blue: 59/255, alpha: 1)
    var Stage1 = "DIY Quick Soham"
    var Stage2 = "DIY Quick Soham"
    var Stage3 = "DIY Quick Soham"
    var url1 = Bundle.main.url(forResource: "sohamfinal2", withExtension: "mp3")!
    var url2 = Bundle.main.url(forResource: "sohamfinal2", withExtension: "mp3")!
    var url3 = Bundle.main.url(forResource: "sohamfinal2", withExtension: "mp3")!
}

class Rest : Technique {
    var name = "Rest"
    var color = UIColor(red: 157/255, green: 224/255, blue: 173/255, alpha: 1)
    var Stage1 = "Transition"
    var Stage2 = "15 Seconds"
    var Stage3 = "Begin"
    var url1 = Bundle.main.url(forResource: "transition", withExtension: "mp3")!
    var url2 = Bundle.main.url(forResource: "15secondsilence", withExtension: "mp3")!
    var url3 = Bundle.main.url(forResource: "begin", withExtension: "mp3")!
}

class Aum : Technique {
    
    var name = "Aum"
    var color = UIColor(red: 84/255, green: 121/255, blue: 128/255, alpha: 1)
    var Stage1 = "3 Times"
    var Stage2 = "Take a Deep Breath"
    var Stage3 = "Take a Deep Breath"
    var url1 = Bundle.main.url(forResource: "aum1", withExtension: "mp3")!
    var url2 = Bundle.main.url(forResource: "aum2", withExtension: "mp3")!
    var url3 = Bundle.main.url(forResource: "aum3", withExtension: "mp3")!
}



