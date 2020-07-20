//
//  SplashScene.swift
//  GuestureBrick
//
//  Created by jim on 2017/5/5.
//  Copyright © 2017年 Jim. All rights reserved.
//

import SpriteKit

class SplashScene: SKScene {
    internal var currentLevel: Int = 1
    internal var guiLenMax:CGFloat = 0.0
    internal var guiHeiMax:CGFloat = 0.0

    override func didMove(to view: SKView) {
        self.guiLenMax = self.frame.width
        self.guiHeiMax = self.frame.height
        self.currentLevel = getCurrentLevelFromHistory()
        
        var targetName = splashArr[0]
        switch(self.currentLevel){
        case 1:
            targetName = splashArr[0]
            break
        case 2:
            targetName = splashArr[1]
            break
        case 3:
            targetName = splashArr[2]
            break
        default:
            let x = arc4random_uniform(UInt32(splashArr.count))
            targetName = splashArr[Int(x)]
            break
        }
        
        let spNode = BMBSplash(title: "Level:\(self.currentLevel)", widMax: guiLenMax, heiMax: guiHeiMax, imageNamed: targetName,zoom:0.9)
        self.addChild(spNode)
        
        let slide = SKTransition.push(with: SKTransitionDirection.down, duration: 1.0)
        let gameScene = GameScene()
        gameScene.size = self.frame.size
        gameScene.scaleMode = .aspectFill
        
        self.run(SKAction.wait(forDuration: 2.0), completion: {
            self.view?.presentScene(gameScene,transition:slide)
        })
    }
    
    /*
    internal func slideToLevel(){
        let slide = SKTransition.push(with: SKTransitionDirection.left, duration: 0.3)
        let soundNode = SKAudioNode(fileNamed: "hit30.wav")
        soundNode.autoplayLooped = false
        soundNode.isPositional = true
        soundNode.position = CGPoint.zero
        self.addChild(soundNode)
        let moveAction = SKAction.move(to: CGPoint.zero, duration: 0.5)
        var actSeq:SKAction = SKAction.group([moveAction])
        if(getSoundSetting()){
            let soundAction = SKAction.run({soundNode.run(SKAction.play())})
            actSeq = SKAction.group([moveAction,soundAction])
        }
        soundNode.run(actSeq, completion: {
            let gameScene = GameScene()
            gameScene.size = self.frame.size
            gameScene.scaleMode = .aspectFill
            self.view?.presentScene(gameScene,transition:slide)
            //soundNode.removeFromParent()
        })
    }
     */
}
