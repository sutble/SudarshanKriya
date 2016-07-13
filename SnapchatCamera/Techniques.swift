//
//  Techniques.swift
//  ArtOfLiving
//
//  Created by Aditya Garg on 7/13/16.
//  Copyright © 2016 Archetapp. All rights reserved.
//

import Foundation

protocol Technique{
    var name: String {get}
    var repitition : Int {get set}
    var Stage1 : String {get}
    var Stage2 : String {get}
    var Stage3 : String {get}
    func function(repitition : Int)
    
}

class Ujayi : Technique {
    
    var name = "Ujayi Breath"
    var repitition = 10
    var Stage1 = "Waist"
    var Stage2 = "Breast"
    var Stage3 = "Back"
    func function(reptition : Int)
    {
        print(name)
    }
}

class Bhastrika : Technique {
    
    var name = "Bhastrika"
    var repitition = 15
    var Stage1 = "Bellows Breath"
    var Stage2 = "Bellows Breath"
    var Stage3 = "Bellows Breath"
    func function(reptition : Int)
    {
        print(name)
    }
}

class SudarshanKriya : Technique {
    
    var name = "Sudarshan Kriya"
    var repitition = 20
    var Stage1 = "Long"
    var Stage2 = "Medium"
    var Stage3 = "Short"
    func function(reptition : Int)
    {
        print(name)
    }
}