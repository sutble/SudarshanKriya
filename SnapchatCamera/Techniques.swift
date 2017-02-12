//
//  Techniques.swift
//  ArtOfLiving
//
//  Created by Aditya Garg on 7/13/16.
//  Copyright © 2016 Archetapp. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class Technique{
    
    init(name: String, color: UIColor, stage: Int, scene: String, url: URL){
        self.name = name
        self.color = color
        self.stage = stage
        self.scene = scene
        self.url = url
    }
    
    var name: String
    var color : UIColor
    var stage : Int
    var scene : String
    var url : URL     
}

class Ujayi  {
    var name = "Ujayi Breath"
    var color = UIColor(red: 69/255, green: 173/255, blue: 168/255, alpha: 1)
    var scene : SKScene = SampleScene(size: CGSize(width: 0, height: 0))
    var url1 = Bundle.main.url(forResource: "UjayiBreath", withExtension: "mp3")!
    var url2 = Bundle.main.url(forResource: "UjayiBreath", withExtension: "mp3")!
    var url3 = Bundle.main.url(forResource: "UjayiBreath", withExtension: "mp3")!
}

class Bhastrika {
    
    var name = "Bhastrika"
    var color = UIColor(red: 232/255, green: 74/255, blue: 95/255, alpha: 1)
    var scene : SKScene = SampleScene(size: CGSize(width: 0, height: 0))
    var url1 = Bundle.main.url(forResource: "bhastrikafinal", withExtension: "mp3")!
    var url2 = Bundle.main.url(forResource: "bhastrikafinal", withExtension: "mp3")!
    var url3 = Bundle.main.url(forResource: "bhastrikafinal", withExtension: "mp3")!
}

class SudarshanKriya {
    
    var name = "Sudarshan Kriya"
    var color = UIColor(red: 42/255, green: 54/255, blue: 59/255, alpha: 1)
    var scene : SKScene = SampleScene(size: CGSize(width: 0, height: 0))
    var url1 = Bundle.main.url(forResource: "SriSoham", withExtension: "mp3")!
    var url2 = Bundle.main.url(forResource: "SriSoham", withExtension: "mp3")!
    var url3 = Bundle.main.url(forResource: "SriSoham", withExtension: "mp3")!
}

class Rest {
    var name = "Rest"
    var color = UIColor(red: 157/255, green: 224/255, blue: 173/255, alpha: 1)
    var scene : SKScene = SampleScene(size: CGSize(width: 0, height: 0))
    var url1 = Bundle.main.url(forResource: "transition", withExtension: "mp3")!
    var url2 = Bundle.main.url(forResource: "restTransition", withExtension: "mp3")!
    var url3 = Bundle.main.url(forResource: "begin", withExtension: "mp3")!
}

class Aum {
    
    var name = "Aum"
    var color = UIColor(red: 84/255, green: 121/255, blue: 128/255, alpha: 1)
    var scene : SKScene = SampleScene(size: CGSize(width: 0, height: 0))
    var url1 = Bundle.main.url(forResource: "aum1", withExtension: "mp3")!
    var url2 = Bundle.main.url(forResource: "aum2", withExtension: "mp3")!
    var url3 = Bundle.main.url(forResource: "aum2", withExtension: "mp3")!
}



