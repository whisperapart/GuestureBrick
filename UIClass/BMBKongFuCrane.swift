//
//  BMBKongFuCrane.swift
//  GuestureBrick
//
//  Created by jim on 2017/4/20.
//  Copyright © 2017年 Jim. All rights reserved.
//

import Foundation
import SpriteKit

class BMBKongFuCrane : BMBKongFu{
    private var startPoint:CGPoint = CGPoint.zero
    private var endPoint:CGPoint = CGPoint.zero
    
    override init(startPoint:CGPoint,endPoint:CGPoint){
        let cosX = endPoint.x - startPoint.x
        let sinX = endPoint.y - startPoint.y
        let length = sqrt(cosX * cosX + sinX * sinX)
        let X = cosX / length
        let Y = sinX / length
        
        let fistSize = CGSize(width: Crane.Width, height: Crane.Thickness)
        let txture = SKTexture(imageNamed:"Crane")
        super.init(texture:txture, color: UIColor.white, size: fistSize)
        self.colorBlendFactor = 1.0
        self.color = UIColor.white
        self.position = startPoint
        self.zPosition = Crane.zIndex
        self.name = Crane.Name
        self.startPoint = startPoint
        self.endPoint = CGPoint(x: startPoint.x+Crane.Range*X,y: startPoint.y+Crane.Range*Y)
        let touchAngle = atan2(Y,X)
        self.zRotation = touchAngle - CGFloat(Double.pi/2)
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
        let fire = SKAction.move(to: self.endPoint, duration: Crane.Douration)
        let actSeq:SKAction = SKAction.sequence([fire])
        self.run(actSeq, completion: {
            self.removeFromParent()
        })
    }
    
}
