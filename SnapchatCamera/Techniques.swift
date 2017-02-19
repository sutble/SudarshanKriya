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



