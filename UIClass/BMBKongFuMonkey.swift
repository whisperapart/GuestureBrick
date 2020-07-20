//
//  BMBKongFuMonkey.swift
//  GuestureBrick
//
//  Created by jim on 2017/4/20.
//  Copyright © 2017年 Jim. All rights reserved.
//

import Foundation
import SpriteKit

class BMBKongFuMonkey : SKCropNode{
    private var startPoint:CGPoint = CGPoint.zero
    private var endPoint:CGPoint = CGPoint.zero
    private var rightClide:SKSpriteNode? = nil
    private var leftClide:SKSpriteNode? = nil
    private var midClide:BMBKongFu? = nil
    
    init(startPoint:CGPoint,endPoint:CGPoint){
        super.init()
        
        let img = UIImage(named: "Monkey")
        let fistSize = CGSize(width: Monkey.totalLength, height: Monkey.Width)
        UIGraphicsBeginImageContextWithOptions(fistSize, false, 0.0)
        img?.draw(in: CGRect(x: 0, y: 0, width: fistSize.width, height: fistSize.height))
        let newImg = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        let texture = SKTexture(image: newImg!)
        let skelet = SKSpriteNode(texture: texture, color: UIColor.clear, size: fistSize)
        
        let visibleSize = CGSize(width: Monkey.Length, height:Monkey.Width)
        let mask = SKSpriteNode(color: UIColor.black, size: visibleSize)
        mask.position = CGPoint(x: -Monkey.totalLength/2+Monkey.Length/2, y: 0)
        
        self.takeCarePhysics()
        
        self.addChild(skelet)
        self.maskNode = mask
        self.zPosition = Monkey.zIndex
        self.name = "MonkeyWrap"
        
        let cosX = endPoint.x - startPoint.x
        let sinX = endPoint.y - startPoint.y
        let length = sqrt(cosX * cosX + sinX * sinX)
        let X = cosX / length
        let Y = sinX / length
        let fixedStart = CGPoint(x: startPoint.x + X*Monkey.totalLength/2, y: startPoint.y + Y*Monkey.totalLength/2)
        self.startPoint = fixedStart
        //self.endPoint = CGPoint(x: startPoint.x+Tiger.Range*X,y: startPoint.y+Tiger.Range*Y)
        self.position = fixedStart
        let touchAngle = atan2(Y,X)
        self.zRotation = touchAngle
        //self.physicsBody = mask.physicsBody
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func takeCarePhysics(){
        let rightSize = CGSize(width: Monkey.Thickness, height: Monkey.Width/2)
        self.rightClide = SKSpriteNode(color: UIColor.clear, size: rightSize)
        self.rightClide?.position = CGPoint(x:-Monkey.totalLength/2-Monkey.Thickness/2+Monkey.Length,y:0)
        self.rightClide?.physicsBody = SKPhysicsBody(rectangleOf: rightSize)
        self.rightClide?.physicsBody?.categoryBitMask = PhysicsCategory.KongfuMK
        self.rightClide?.physicsBody?.contactTestBitMask = PhysicsCategory.Ball | PhysicsCategory.Buff
        self.rightClide?.physicsBody?.affectedByGravity = false
        self.rightClide?.physicsBody?.friction = 0.0
        self.rightClide?.physicsBody?.isDynamic = false
        self.rightClide?.physicsBody?.usesPreciseCollisionDetection = true
        self.rightClide?.physicsBody?.restitution = 1.0
        self.rightClide?.physicsBody?.linearDamping = 0.0
        self.rightClide?.physicsBody?.allowsRotation = false
        self.addChild(self.rightClide!)
        
        self.leftClide = SKSpriteNode(color: UIColor.clear, size: rightSize)
        self.leftClide?.position = CGPoint(x:-Monkey.totalLength/2+Monkey.Thickness/2,y:0)
        self.leftClide?.physicsBody = SKPhysicsBody(rectangleOf: rightSize)
        self.leftClide?.physicsBody?.categoryBitMask = PhysicsCategory.KongfuMK
        self.leftClide?.physicsBody?.contactTestBitMask = PhysicsCategory.Ball
        self.leftClide?.physicsBody?.affectedByGravity = false
        self.leftClide?.physicsBody?.friction = 0.0
        self.leftClide?.physicsBody?.isDynamic = false
        self.leftClide?.physicsBody?.usesPreciseCollisionDetection = true
        self.leftClide?.physicsBody?.restitution = 1.0
        self.leftClide?.physicsBody?.linearDamping = 0.0
        self.leftClide?.physicsBody?.allowsRotation = false
        self.addChild(self.leftClide!)
        
        let midSize = CGSize(width: Monkey.Length - Monkey.Thickness * 2, height: Monkey.Thickness*1.5)
        //self.midClide = SKSpriteNode(color: UIColor.clear, size: midSize)
        self.midClide = BMBKongFu(texture: nil, color: UIColor.clear, size: midSize)
        self.midClide?.name = Monkey.Name
        self.midClide?.position = CGPoint(x:(Monkey.Length - Monkey.totalLength)/2,y:0)
        self.midClide?.physicsBody = SKPhysicsBody(rectangleOf: midSize)
        self.midClide?.physicsBody?.categoryBitMask = PhysicsCategory.Kongfu
        self.midClide?.physicsBody?.contactTestBitMask = PhysicsCategory.Ball
        self.midClide?.physicsBody?.affectedByGravity = false
        self.midClide?.physicsBody?.friction = 0.0
        self.midClide?.physicsBody?.isDynamic = false
        self.midClide?.physicsBody?.usesPreciseCollisionDetection = true
        self.midClide?.physicsBody?.restitution = 1.0
        self.midClide?.physicsBody?.linearDamping = 0.0
        self.midClide?.physicsBody?.allowsRotation = false
        self.addChild(self.midClide!)
    }
    
    public func fire(){
        //let tiger = SKAction.scaleX(to: 1.5, duration: 0.25)
        
        
        let rightEnd = CGPoint(x:Monkey.totalLength/2-Monkey.Thickness/2,y:0)
        let rightFire = SKAction.move(to: rightEnd, duration: Monkey.Douration)
        let rightAction = SKAction.group([rightFire])
        self.rightClide?.run(rightAction, completion: {
            self.removeFromParent()
        })
        
        let leftEnd = CGPoint(x:Monkey.totalLength/2-Monkey.Length+Monkey.Thickness/2,y:0)
        let leftFire = SKAction.move(to: leftEnd, duration: Monkey.Douration)
        let leftAction = SKAction.group([leftFire])
        self.leftClide?.run(leftAction, completion: {
            self.removeFromParent()
        })
        
        let midEnd = CGPoint(x:Monkey.totalLength/2-Monkey.Length/2,y:0)
        let midFire = SKAction.move(to: midEnd, duration: Monkey.Douration)
        let midAction = SKAction.group([midFire])
        self.midClide?.run(midAction, completion: {
            self.removeFromParent()
        })
        
        let end = CGPoint(x: Monkey.totalLength/2-Monkey.Length/2,y:0)
        let fire = SKAction.move(to: end, duration: Monkey.Douration)
        //let sd = SKAction.playSoundFileNamed("monkey60.wav", waitForCompletion: false)
        
        let actSeq:SKAction = SKAction.group([fire])
        
        self.maskNode?.run(actSeq, completion: {
            self.removeFromParent()
        })
 
    }
    
}

/*
class BMBKongFuMonkey_OLD : BMBKongFu{
    private var startPoint:CGPoint = CGPoint.zero
    private var endPoint:CGPoint = CGPoint.zero
    
    override init(startPoint:CGPoint,endPoint:CGPoint){
        let fistSize = CGSize(width: 288, height: 36)
        let mkTexture = SKTexture(imageNamed: "Monkey")
        let spTexture = SKSpriteNode(texture: mkTexture, color: UIColor.clear, size: fistSize)
        
        let cropNode = SKCropNode()
        let visibleSize = CGSize(width:72, height:36)
        let mask = SKSpriteNode(color: UIColor.black, size: visibleSize)
        mask.position = CGPoint.zero
        
        let placeHolder = SKSpriteNode(color:UIColor.clear,size:visibleSize)
        placeHolder.name = "placeHolder"
        placeHolder.position = CGPoint.zero
        placeHolder.physicsBody = SKPhysicsBody(rectangleOf: visibleSize)
        placeHolder.physicsBody?.categoryBitMask = PhysicsCategory.Kongfu
        placeHolder.physicsBody?.contactTestBitMask = PhysicsCategory.Ball
        placeHolder.physicsBody?.affectedByGravity = false
        placeHolder.physicsBody?.friction = 0.0
        placeHolder.physicsBody?.isDynamic = false
        placeHolder.physicsBody?.usesPreciseCollisionDetection = true
        placeHolder.physicsBody?.restitution = 1.0
        placeHolder.physicsBody?.linearDamping = 0.0
        placeHolder.physicsBody?.allowsRotation = false
        
        
        cropNode.addChild(spTexture)
        cropNode.addChild(placeHolder)
        cropNode.maskNode = mask
        
        super.init(texture:nil, color: UIColor.clear, size: mkTexture.size())
        self.addChild(cropNode)
        
        self.position = startPoint
        self.zPosition = 110
        self.name = "Monkey"
        let cosX = endPoint.x - startPoint.x
        let sinX = endPoint.y - startPoint.y
        let length = sqrt(cosX * cosX + sinX * sinX)
        let X = cosX / length
        let Y = sinX / length
        self.startPoint = startPoint
        self.endPoint = CGPoint(x: startPoint.x+Tiger.Range*X,y: startPoint.y+Tiger.Range*Y)
        let touchAngle = atan2(Y,X)
        self.zRotation = touchAngle
        self.physicsBody = SKPhysicsBody(rectangleOf: mask.size)
        self.physicsBody?.categoryBitMask = PhysicsCategory.Kongfu
        self.physicsBody?.contactTestBitMask = PhysicsCategory.Ball
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.friction = 0.0
        self.physicsBody?.isDynamic = false
        self.physicsBody?.usesPreciseCollisionDetection = true
        self.physicsBody?.restitution = 1.0
        self.physicsBody?.linearDamping = 0.0
        self.physicsBody?.allowsRotation = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func fire(){
        //let tiger = SKAction.scaleX(to: 1.5, duration: 0.25)
        let fire = SKAction.move(to: self.endPoint, duration: 2.0)
        //let sd = SKAction.playSoundFileNamed("monkey60.wav", waitForCompletion: false)
        var actSeq:SKAction = SKAction.group([fire])
        let soundNode = SKAudioNode(fileNamed: "monkey60.wav")
        soundNode.autoplayLooped = false
        soundNode.isPositional = true
        self.addChild(soundNode)
        
        if(getSoundSetting()){
            let soundAction = SKAction.run({soundNode.run(SKAction.play())})
            actSeq = SKAction.group([fire,soundAction])
        }
        self.run(actSeq, completion: {
            soundNode.removeFromParent()
            self.removeFromParent()
        })
    }
    
}
 */

