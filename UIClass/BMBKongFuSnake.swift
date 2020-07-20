//
//  BMBKongFuSnake.swift
//  GuestureBrick
//
//  Created by jim on 2017/4/20.
//  Copyright © 2017年 Jim. All rights reserved.
//

import Foundation
import SpriteKit

class BMBKongFuSnake : BMBKongFu{
    private var startPoint:CGPoint = CGPoint.zero
    private var retreatPoint:CGPoint = CGPoint.zero
    private var attackPoint:CGPoint = CGPoint.zero
    private var endPoint:CGPoint = CGPoint.zero
    
    override init(startPoint:CGPoint,endPoint:CGPoint){
        let cosX = endPoint.x - startPoint.x
        let sinX = endPoint.y - startPoint.y
        let length = sqrt(cosX * cosX + sinX * sinX)
        let X = cosX / length
        let Y = sinX / length
        
        let fistSize = CGSize(width: Snake.Width, height: Snake.Thickness)
        let txture = SKTexture(imageNamed:"Snake")
        super.init(texture:txture, color: UIColor.white, size: fistSize)
        self.colorBlendFactor = 1.0
        self.color = UIColor.white
        self.position = startPoint
        self.zPosition = Snake.zIndex
        self.name = Snake.Name
        
        let rangeX = Snake.Range*X
        let rangeY = Snake.Range*Y
        let rangeXQ = rangeX/6.0
        let rangeYQ = rangeY/6.0
        self.startPoint     = startPoint
        self.retreatPoint   = CGPoint(x: self.startPoint.x+rangeXQ, y: self.startPoint.y+rangeYQ)
        self.endPoint       = CGPoint(x: self.startPoint.x+rangeX,  y: self.startPoint.y+rangeY)
        self.attackPoint    = CGPoint(x: self.endPoint.x-rangeXQ,   y: self.endPoint.y-rangeYQ)
        let touchAngle = atan2(Y,X)
        //self.zRotation = touchAngle - CGFloat(Double.pi/2)
        self.zRotation = touchAngle + CGFloat(Double.pi/4)

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
        let snake1 = SKAction.move(to: self.retreatPoint, duration: Snake.Douration/3)
        let snake2 = SKAction.move(to: self.endPoint, duration: Snake.Douration/3)
        let snake3 = SKAction.move(to: self.attackPoint, duration: Snake.Douration/3)
        let action = SKAction.sequence([snake1,snake2,snake3])
        //let sd = SKAction.playSoundFileNamed("snake50.wav", waitForCompletion: false)
        let actSeq:SKAction = SKAction.group([action])
        self.run(actSeq, completion: {
            self.removeFromParent()
        })
    }
    
}

