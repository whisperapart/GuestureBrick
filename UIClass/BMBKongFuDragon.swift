//
//  BMBKongFuDragon.swift
//  GuestureBrick
//
//  Created by jim on 2017/4/20.
//  Copyright © 2017年 Jim. All rights reserved.
//

import Foundation
import SpriteKit

class BMBKongFuDragon : BMBKongFu{
    private var startPoint:CGPoint = CGPoint.zero
    private var endPoint:CGPoint = CGPoint.zero
    
    override init(startPoint:CGPoint,endPoint:CGPoint){
        let fistSize = CGSize(width: Dragon.Width, height: Dragon.Thickness)
        let txture = SKTexture(imageNamed: "Dragon")
        super.init(texture:txture, color: UIColor.clear, size: fistSize)
        
        self.zPosition = 110
        self.name = Dragon.Name
 
        let cosX = endPoint.x - startPoint.x
        let sinX = endPoint.y - startPoint.y
        let length = sqrt(cosX * cosX + sinX * sinX)
        let X = cosX / length
        let Y = sinX / length
        self.startPoint = startPoint
        self.anchorPoint = CGPoint(x: -1.0, y: 0)
        
        // this one is okay with xScale=3.0
        // self.endPoint = CGPoint(x:startPoint.x-Dragon.Width*X*Dragon.xScale/2-Dragon.Width*X , y:startPoint.y-Dragon.Width*Y*Dragon.xScale/2-Dragon.Width*Y)
        
        self.endPoint = CGPoint(x: startPoint.x - Dragon.Width*X*Dragon.xScale + Dragon.Width*X/2, y: startPoint.y - Dragon.Width*Y*Dragon.xScale + Dragon.Width*Y/2)
        
        let touchAngle = atan2(Y,X)
        self.zRotation = touchAngle
        self.position = CGPoint(x:startPoint.x-Dragon.Width*X/2 ,y:startPoint.y-Dragon.Width*Y/2)
        self.physicsBody = SKPhysicsBody(rectangleOf: fistSize, center: CGPoint(x: Dragon.Width*1.5, y: Dragon.Thickness*0.5))
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
        //let dragon = SKAction.resize(toWidth: Dragon.Width*Dragon.xScale, duration: Dragon.Douration)
        let dragon = SKAction.scaleX(to: Dragon.xScale, duration: Dragon.Douration)
        let fire = SKAction.move(to: self.endPoint, duration: Dragon.Douration)
        //let sd = SKAction.playSoundFileNamed("dragon50.wav", waitForCompletion: false)
        let actGrp:SKAction = SKAction.group([dragon,fire])
        let actSeq = SKAction.sequence([actGrp,SKAction.wait(forDuration: Dragon.Douration*2)])
        self.run(actSeq, completion: {
            self.removeFromParent()
        })
    }
    
}

