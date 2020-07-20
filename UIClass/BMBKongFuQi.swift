//
//  BMBKongFuQi.swift
//  GuestureBrick
//
//  Created by jim on 2017/4/20.
//  Copyright © 2017年 Jim. All rights reserved.
//

import Foundation
import SpriteKit

class BMBKongFuQi : BMBKongFu{
    private var startPoint:CGPoint = CGPoint.zero
    private var endPoint:CGPoint = CGPoint.zero
    
    override init(startPoint:CGPoint,endPoint:CGPoint){
        let fistSize = CGSize(width: Qi.Radius*2, height: Qi.Radius*2)
        let txture = SKTexture(imageNamed: "BallE")
        super.init(texture:txture, color: UIColor.clear, size: fistSize)
        self.position = startPoint
        self.zPosition = 110
        self.name = Qi.Name
        let cosX = endPoint.x - startPoint.x
        let sinX = endPoint.y - startPoint.y
        let length = sqrt(cosX * cosX + sinX * sinX)
        let X = cosX / length
        let Y = sinX / length
        self.startPoint = startPoint
        self.endPoint = CGPoint(x: startPoint.x+Qi.Range*X,y: startPoint.y+Qi.Range*Y)
        let touchAngle = atan2(Y,X)
        if(X>0){
            self.zRotation = CGFloat(Double.pi/2) + touchAngle
        }else{
            self.zRotation = touchAngle - CGFloat(Double.pi/2)
        }
        self.physicsBody = SKPhysicsBody(texture: txture, size: fistSize)
        self.physicsBody?.categoryBitMask = PhysicsCategory.Kongfu
        self.physicsBody?.contactTestBitMask = PhysicsCategory.Ball | PhysicsCategory.Buff
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
        let sc = Qi.explodeRadius / Qi.Radius
        let explode = SKAction.scale(to: sc, duration: Qi.Douration)
        let fire = SKAction.move(to: self.endPoint, duration: Qi.Douration)
        //let sd = SKAction.playSoundFileNamed("qi45.wav", waitForCompletion: false)
        let actSeq:SKAction = SKAction.group([fire,explode])
        self.run(actSeq, completion: {
            self.removeFromParent()
        })
    }
    
}

