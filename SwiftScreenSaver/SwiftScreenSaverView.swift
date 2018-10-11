//
//  SwiftScreenSaverView.swift
//  SwiftScreenSaver
//
//  Created by Eric Li on 10/03/18.
//  Copyright © O-R-G inc. All rights reserved.
//

import Cocoa
import ScreenSaver
import SpriteKit

class SwiftScreenSaverView: ScreenSaverView {
    
    var spriteView: SpriteScreenSaverView?

    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        self.animationTimeInterval = 1.0
        
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.animationTimeInterval = 1.0
    }
    
    override var frame: NSRect {
        didSet
        {
            self.spriteView?.frame = frame
        }
    }
    
    override func startAnimation() {
        if self.spriteView == nil {
            let spriteView = SpriteScreenSaverView(frame: self.frame)
            
            spriteView.ignoresSiblingOrder = true
            spriteView.showsFPS = false
            spriteView.showsNodeCount = false
            spriteView.ignoresSiblingOrder = true
            
            let scene = SpriteScreenSaverScene()
            scene.size = frame.size;
            scene.scaleMode = .aspectFit;
            scene.backgroundColor = SKColor.init(calibratedRed: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
            
            self.spriteView = spriteView
            addSubview(spriteView)
            spriteView.presentScene(scene)
        }
        super.startAnimation()
    }
    
}
