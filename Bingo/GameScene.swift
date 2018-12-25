//
//  GameScene.swift
//  Bingo
//
//  Created by tcs17181 on 2018/12/25.
//  Copyright © 2018年 tcs17181. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var suuji: Int = 1 {
        didSet {
            bingoNumber.text = "Bingo Number: \(suuji)"
        }
    }
    
    
    var button:SKSpriteNode!
    
    var bingoNumber: SKLabelNode!
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = SKColor.yellow
        
        self.button = SKSpriteNode(imageNamed: "go")
        self.button.position = CGPoint(x: frame.midX, y: frame.midY - frame.height/8)
        self.button.xScale = 0.3
        self.button.yScale = 0.2
        self.button.zPosition = 0
        addChild(self.button)
        
        bingoNumber = SKLabelNode(text: "0")
        bingoNumber.fontName = "Papyrus"
        bingoNumber.fontSize = 100
        bingoNumber.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(bingoNumber)
        
        
    }
    
    func arc4random(lower: UInt32, upper: UInt32) -> UInt32 {
        guard upper >= lower else {
            return 0
        }
        
        return arc4random_uniform(upper - lower) + lower
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            let touchNode = self.atPoint(location)
            //ugokiの変数を0にする
            if touchNode == button {
                Number =
                for _ in 1 ... 75 {
                    print(arc4random(lower: 10, upper: 15))
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
