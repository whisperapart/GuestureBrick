//
//  BMBKongFuTaiChi.swift
//  GuestureBrick
//
//  Created by jim on 2017/4/20.
//  Copyright © 2017年 Jim. All rights reserved.
//

import Foundation
import SpriteKit

class BMBKongFuTaiChi : BMBKongFu{
    private var startPoint:CGPoint = CGPoint.zero
    private var endPoint:CGPoint = CGPoint.zero
    
    override init(startPoint:CGPoint,endPoint:CGPoint){
        let taichiTxt = SKTexture(imageNamed: "TaiChi")
        let fistSize = CGSize(width: TaiChi.Radius*2, height: TaiChi.Radius*2)
        super.init(texture:taichiTxt, color: UIColor.white, size: fistSize)
        self.position = startPoint
        self.zPosition = 110
        self.name = TaiChi.Name
        let cosX = endPoint.x - startPoint.x
        let sinX = endPoint.y - startPoint.y
        let length = sqrt(cosX * cosX + sinX * sinX)
        let X = cosX / length
        let Y = sinX / length
        self.startPoint = startPoint
        self.endPoint = CGPoint(x: startPoint.x+TaiChi.Range*X,y: startPoint.y+TaiChi.Range*Y)
        let touchAngle = atan2(Y,X)
        if(X>0){
            self.zRotation = CGFloat(Double.pi/2) + touchAngle
        }else{
            self.zRotation = touchAngle - CGFloat(Double.pi/2)
        }
        self.physicsBody = SKPhysicsBody(texture: taichiTxt, size: fistSize)
        self.physicsBody?.categoryBitMask = PhysicsCategory.KongfuTC
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
        let roll = SKAction.rotate(byAngle: TaiChi.Angel, duration: TaiChi.Douration)
        //let roll = SKAction.rotate(byAngle: 0, duration: TaiChi.Douration)
        let fire = SKAction.move(to: self.endPoint, duration: TaiChi.Douration)
        //let sd = SKAction.playSoundFileNamed("taichi45", waitForCompletion: false)
        let actSeq:SKAction = SKAction.group([roll,fire])
        
        self.run(actSeq, completion: {
            self.removeFromParent()
        })
    }
    
}

