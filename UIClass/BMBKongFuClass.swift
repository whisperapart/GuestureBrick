//
//  BMBKongFuClass.swift
//  GuestureBrick
//
//  Created by jim on 16/12/30.
//  Copyright © 2016年 Jim. All rights reserved.
//

import SpriteKit


// abstract class, should never be instantiated
class BMBKongFu : SKSpriteNode{
    private var startPoint:CGPoint = CGPoint.zero
    private var endPoint:CGPoint = CGPoint.zero
    
    override init(texture:SKTexture?, color: UIColor, size: CGSize){
        super.init(texture:texture, color: color, size: size)
    }
    init(startPoint:CGPoint,endPoint:CGPoint){
        // just write something garbage to make swift complier feeling happy
        let cosX = endPoint.x - startPoint.x
        let sinX = endPoint.y - startPoint.y
        let length = sqrt(cosX * cosX + sinX * sinX)
        let X = cosX / length
        let Y = sinX / length
        
        let fistSize = CGSize(width: Fist.Width, height: Fist.Thickness)
        super.init(texture:SKTexture(imageNamed:"BrickF"), color: UIColor.white, size: fistSize)
        self.colorBlendFactor = 1.0
        self.color = UIColor.white
        self.position = startPoint
        self.zPosition = Fist.zIndex
        self.name = Tiger.Name
        self.startPoint = startPoint
        self.endPoint = CGPoint(x: startPoint.x+Fist.Range*X,y: startPoint.y+Fist.Range*Y)
        let touchAngle = atan2(Y,X)
        self.zRotation = CGFloat(Double.pi/2) + touchAngle
        self.physicsBody = SKPhysicsBody(rectangleOf: fistSize)
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
    
    
    public func fire(){
        let fire = SKAction.move(to: self.endPoint, duration: Fist.Douration)
        let actSeq:SKAction = SKAction.sequence([fire])
        self.run(actSeq, completion: {
            self.removeFromParent()
        })
    }
}
