//
//  KriyScene.swift
//  
//
//  Created by Aditya Garg on 2/12/17.
//
//

import UIKit
import SpriteKit

class KriyScene: SKScene {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        self.backgroundColor = UIColor.gray
        
    }
    
    func getFrames(atlasString : String, count: Int) -> [SKTexture]{
        var frames : [SKTexture] = []
        
        let atlas = SKTextureAtlas(named: atlasString)
        
        for i in 1 ... count {
            
            var number = ""
            if(i<10){
                number = "00" + String(i)
            }
            else if(i<100){
                number = "0" + String(i)
            }
            else{
                number = String(i)
            }
            
            let string = atlasString + "." + number + ".png"
            let texture = atlas.textureNamed(string)
            frames.append(texture)
        }
        return frames
    }
    
    
    func start(position: CGPoint, sceneName: String){
        
        let frames = getFrames(atlasString: sceneName, count: 400)
        let texture = frames[0]
        let Kriy = SKSpriteNode(texture: texture)
        Kriy.size = CGSize(width: 400, height: 400)
        Kriy.position = CGPoint(x: position.x+20, y: position.y-250)
        
        self.addChild(Kriy)
        
        let animateAction = SKAction.repeat(SKAction.animate(with: frames, timePerFrame: 0.08, resize: false, restore: true), count: 1)
        
        let removeAction = SKAction.run {
            Kriy.removeAllActions()
            Kriy.removeFromParent()
        }
        let allActions = SKAction.sequence([animateAction,removeAction])
        
        Kriy.run(allActions)
    }
    
}

