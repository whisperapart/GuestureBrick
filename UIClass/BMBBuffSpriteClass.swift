//
//  BMBBuffSpriteClass.swift
//  GuestureBrick
//
//  Created by jim on 16/12/27.
//  Copyright © 2016年 Jim. All rights reserved.
//

import SpriteKit

class BMBBuffSprite : SKShapeNode{
    public let bType:BuffEffect
    public var isHitByKF:Bool
    init(type:BuffEffect,pos:CGPoint,w:CGFloat){
        let bSize = CGSize(width: w, height: w)
        self.bType = type
        self.isHitByKF = false
        //let bRect = CGRect(origin: CGPoint(x:pos.x-w/2.0,y:pos.y-w), size: bSize)
        //super.init(texture: nil, color: UIColor.clear, size: bSize)
        super.init()
        //self.path = CGPath(ellipseIn: bRect,transform: nil)
        self.path = CGPath(ellipseIn: CGRect(origin: CGPoint(x:-w/2.0,y:-w/2.0), size: bSize),transform: nil)
        self.position = pos
        self.name = "buffSprite"
        self.strokeColor = UIColor.clear
        self.fillColor = UIColor.clear
        self.lineWidth = 0
        self.glowWidth = 0.0
        self.zPosition = 104
        self.isAntialiased = false
        
        let item = SKLabelNode(fontNamed: "FontAwesome")
        //item.text = self.getIconByType(type: type)
        //item.fontColor = UIColor.white
        item.text = BuffStrArr[type.rawValue]
        item.fontColor = BuffColorArr[type.rawValue]
        
        item.fontSize = w
        //item.position =  CGPoint(x: pos.x, y: pos.y-3.0*w/4.0)
        //item.position = CGPoint(x:w,y:-3.0*w/4.0)
        item.position = CGPoint(x:0,y:-w/3.0)

        self.addChild(item)
        self.takeCareOfPhysics(w:w)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func getIconByType(type:BuffEffect) -> String{
        switch type{
        case BuffEffect.BigBall:
            return FontAwesome.arrowsAlt
        case BuffEffect.SmallBall:
            return FontAwesome.bullseye
        case BuffEffect.FastBall:
            return FontAwesome.bolt
        case BuffEffect.SlowBall:
            return FontAwesome.paperPlane
        case BuffEffect.PowerBall:
            return FontAwesome.sunO
        case BuffEffect.WeakBall:
            return FontAwesome.moonO
        //case BuffEffect.WidePad:
        //    return FontAwesome.chevronRight
        //case BuffEffect.NarrowPad:
        //    return FontAwesome.chevronLeft
        case BuffEffect.Diamond:
            return FontAwesome.diamond
        //case BuffEffect.StickPad:
        //    return FontAwesome.pause
        default:
            return FontAwesome.diamond
        }
    }
   
    
    internal func takeCareOfPhysics(w:CGFloat){
        
        //self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.path!)
        self.physicsBody = SKPhysicsBody(circleOfRadius: w/2)
        self.physicsBody?.affectedByGravity = true
        //self.physicsBody?.mass = 1.0
        self.physicsBody?.friction = 0.0
        self.physicsBody?.isDynamic = true
        self.physicsBody?.usesPreciseCollisionDetection = true;
        self.physicsBody?.restitution = 1.0
        self.physicsBody?.linearDamping = 0.0
        self.physicsBody?.categoryBitMask = PhysicsCategory.Buff
        self.physicsBody?.collisionBitMask = PhysicsCategory.Kongfu | PhysicsCategory.Boundary | PhysicsCategory.KongfuMK | PhysicsCategory.KongfuTC
        self.physicsBody?.contactTestBitMask = PhysicsCategory.Kongfu | PhysicsCategory.Boundary | PhysicsCategory.KongfuMK | PhysicsCategory.KongfuTC
    }
}
