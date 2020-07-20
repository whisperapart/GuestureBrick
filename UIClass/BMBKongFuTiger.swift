//
//  BMBKongFuTiger.swift
//  GuestureBrick
//
//  Created by jim on 2017/4/10.
//  Copyright © 2017年 Jim. All rights reserved.
//

import Foundation
import SpriteKit

/// Tiger: -=|
class BMBKongFuTiger : BMBKongFu{
    private var startPoint:CGPoint = CGPoint.zero
    private var endPoint:CGPoint = CGPoint.zero
    
    override init(startPoint:CGPoint,endPoint:CGPoint){
        let cosX = endPoint.x - startPoint.x
        let sinX = endPoint.y - startPoint.y
        let length = sqrt(cosX * cosX + sinX * sinX)
        let X = cosX / length
        let Y = sinX / length

        let fistSize = CGSize(width: Tiger.Width, height: Tiger.Thickness)
        let fistTexture = SKTexture(imageNamed:"Tiger")
        super.init(texture:fistTexture, color: UIColor.white, size: fistSize)
        self.colorBlendFactor = 1.0
        self.color = UIColor.white
        self.position = startPoint
        self.zPosition = Tiger.zIndex
        self.name = Tiger.Name
        self.startPoint = startPoint
        self.endPoint = CGPoint(x: startPoint.x+Tiger.Range*X,y: startPoint.y+Tiger.Range*Y)
        let touchAngle = atan2(Y,X)
        self.zRotation = CGFloat(Double.pi/2) + touchAngle
        self.physicsBody = SKPhysicsBody(texture: fistTexture, size: fistSize)
        //self.physicsBody = SKPhysicsBody(rectangleOf: fistSize)
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
        let tiger = SKAction.scaleX(to: Tiger.xScale, duration: Tiger.Douration)
        let fire = SKAction.move(to: self.endPoint, duration: Tiger.Douration)
        self.run(SKAction.group([tiger,fire]), completion: {
            self.removeFromParent()
        })
        
        
        
        
    }
    
}

