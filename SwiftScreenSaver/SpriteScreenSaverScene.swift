//
//  SpriteScreenSaverScene.swift
//  SwiftScreenSaver
//
//  Created by Eric Li on 10/03/18.
//  Copyright © O-R-G inc. All rights reserved.
//

import SpriteKit
import Cocoa
import ScreenSaver

class SpriteScreenSaverScene: SKScene
{
    
    var redSquareTexture : SKTexture? = nil
    var blueSquareTexture : SKTexture? = nil
    var spriteList : [SKSpriteNode] = []
    var idx = 0
    
    override var acceptsFirstResponder: Bool { return false }
	
    override func didMove(to view: SKView)
	{
        self.resignFirstResponder()
        self.isUserInteractionEnabled=false
    }
	
	
    override func update(_ currentTime: TimeInterval)
	{
        let size = self.frame
        let boxSize = size.height/200
        
        if (self.spriteList.count < 200000) {
            for _ in 0..<200 {
                let color = getColor()
                for _ in 0..<1000 {
                    let xPos = Int(SSRandomFloatBetween( 0, size.width )) % Int(size.width)
                    let yPos = Int(SSRandomFloatBetween( 0, size.height )) % Int(size.height)
                    
                    let box = SKSpriteNode.init(color: color, size: CGSize.init(width: boxSize, height: boxSize))
                    box.position = CGPoint.init(x: xPos, y: yPos)
                    self.addChild(box)
                    spriteList.append(box)
                }
            }
        } else {
            let color = getColor()
            for _ in 0..<1000 {
                // reset!
                if (idx >= self.spriteList.count) {
                    idx = 0
                    for node in self.spriteList {
                        node.zPosition = 0
                    }
                }
                let xPos = Int(SSRandomFloatBetween( 0, size.width )) % Int(size.width)
                let yPos = Int(SSRandomFloatBetween( 0, size.height )) % Int(size.height)
                
                let node = self.spriteList[idx]
                node.zPosition = 1
                node.position = CGPoint.init(x: xPos, y: yPos)
                node.color = color
                
                idx+=1
            }
        }
    }
    
    func getColor() -> SKColor {
        var color = SKColor.init(calibratedRed: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
        
        if ( Int(SSRandomFloatBetween( 1, 2 )) == 1 ) {
            color = SKColor.init(calibratedRed: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        }
        
        if ( Int(SSRandomFloatBetween( 1, 3 )) == 2 ) {
            color = SKColor.init(calibratedRed: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
        }
        
        return color
    }
}
