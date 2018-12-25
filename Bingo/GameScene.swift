//
//  GameScene.swift
//  Bingo
//
//  Created by tcs17181 on 2018/12/25.
//  Copyright © 2018年 tcs17181. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation

class GameScene: SKScene, AVAudioPlayerDelegate {
    
    var button:SKSpriteNode!
    
    var bingoNumber: SKLabelNode!
    
    //音
    var audioPlayer: AVAudioPlayer!
    func playSound(name: String) {
        guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else {
            print("pikopiko")
            return
        }
        
        do {
            // AVAudioPlayerのインスタンス化
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            
            // AVAudioPlayerのデリゲートをセット
            audioPlayer.delegate = self
            
            // 音声の再生
            audioPlayer.play()
        } catch {
        }
    }
    
    
    var suuji: Int = 1 {
        didSet {
            self.bingoNumber.text = "\(suuji)"
        }
    }
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = SKColor.yellow
        
        self.button = SKSpriteNode(imageNamed: "go")
        self.button.position = CGPoint(x: frame.midX, y: frame.midY - frame.height/8)
        self.button.xScale = 0.3
        self.button.yScale = 0.2
        self.button.zPosition = 0
        addChild(self.button)
        
        self.bingoNumber = SKLabelNode(text: "0")
        self.bingoNumber.fontName = "Papyrus"
        self.bingoNumber.fontSize = 150
        self.bingoNumber.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(self.bingoNumber)
        
        
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
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            let touchNode = self.atPoint(location)
            
            if touchNode == self.button {
                playSound(name: "pikopiko")
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.suuji = Int(self.arc4random(lower: 1, upper: 75))
                }
            }
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
