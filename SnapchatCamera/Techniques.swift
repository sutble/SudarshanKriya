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

class Atlas {
    
    init(name: String, count : Int){
        self.name = name
        self.count = count
    }

    var name: String
    var count : Int
    
    
}

class lolColor {

    let ujayiColor = UIColor(red: 69/255, green: 173/255, blue: 168/255, alpha: 1)
    let restColor = UIColor(red: 157/255, green: 224/255, blue: 173/255, alpha: 1)
    let bhastrikaColor = UIColor(red: 232/255, green: 74/255, blue: 95/255, alpha: 1)
    let aumColor = UIColor(red: 84/255, green: 121/255, blue: 128/255, alpha: 1)
    let kriyaColor = UIColor(red: 42/255, green: 54/255, blue: 59/255, alpha: 1)
    
    
    
}



