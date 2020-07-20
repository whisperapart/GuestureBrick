//
//  BMBBallClass.swift
//  GuestureBrick
//
//  Created by jim on 16/12/24.
//  Copyright © 2016年 Jim. All rights reserved.
//

import SpriteKit

class BMBBall : SKShapeNode{
    internal var damage :Int = Ball.damage
    internal var bSpeed: CGFloat = Ball.speed
    internal var bSpeedRate: CGFloat = 1.0
    internal var direction :CGVector = CGVector.zero
    internal var lastHitBy: String = ""
    
    private init(pos:CGPoint) {
        super.init()
        self.path = CGPath(ellipseIn: CGRect(origin: CGPoint.zero, size: CGSize(width: 2*Ball.radius, height: 2*Ball.radius)),transform: nil)
        self.position = pos
    }
    
    init(pos:CGPoint,name:String){
        super.init()
        self.path = CGPath(ellipseIn: CGRect(origin: CGPoint(x:-Ball.radius,y:-Ball.radius), size: CGSize(width: 2*Ball.radius, height: 2*Ball.radius)),transform: nil)
        self.name = name
        takeCareOfGeometry(pos: pos)
        takeCareOfPhysics()
    }
    
    /*  potiental memory leak
    init(pos:CGPoint,buff:BMBEffectClass,name:String){
        super.init()
        self.path = CGPath(ellipseIn: CGRect(origin: CGPoint(x:-Ball.radius,y:-Ball.radius), size: CGSize(width: 2*Ball.radius, height: 2*Ball.radius)),transform: nil)
        self.name = name
        takeCareOfGeometry(pos: pos)
        takeCareOfPhysics()
        takeCareOfBuff(buff: buff)
    }
     */
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func takeCareOfBuff(speedRate:CGFloat,power:Int,radiusRate:CGFloat){
        self.buffApplySpeed(rate: speedRate)
        self.buffApplyPower(power: power)
        self.buffApplyRadius(rate: radiusRate)
    }
    
    /* potiental memory leak
    public func takeCareOfBuff(buff:BMBEffectClass){
        self.buffApplySpeed(rate: buff.BallSpeedRate)
        self.buffApplyPower(power: buff.BallPower)
        self.buffApplyRadius(rate: buff.BallRadiusRate)
    }
    */
    
    public func launch(direction:CGVector,speedRate:CGFloat){
        self.direction = direction
        self.buffApplySpeed(rate: speedRate)
    }
    public func moveTo(pt:CGPoint){
        self.position = pt
    }
    
    internal func EngineReflect(hitBy:String){
        self.lastHitBy = hitBy
        let vel = (self.physicsBody?.velocity)!
        var ang = atan2(vel.dy,vel.dx)
        let rnd = (drand48()-0.5)/10.0
        ang = ang + CGFloat(rnd)
        self.direction = CGVector(dx: cos(ang), dy: sin(ang))
        self.buffApplySpeed(rate: self.bSpeedRate)
    }
    
    internal func BallReflect(normal:CGVector,hitBy:String){
        // 1. we can remember lastHitBy and compare with current hitby
        // 2. or we can remove colideBitMask in self.physicisBody
        // we use 1 here
        if(self.lastHitBy != hitBy){
            self.lastHitBy = hitBy
            self.reflectWithNormal(normal)
        }else{
            // todo: - 问题在这。第一次碰撞后，即使记住了碰撞的名字，执行else，但是默认的引擎会让他继续检测碰撞，而且因为还没脱离碰撞区，所以还会触发反方向的碰撞，结果就是 球撞到砖块， 执行 ballreflect 球反弹， 但是球还在碰撞区， 又碰撞，执行ballreflect的else 部分，执行引擎的默认碰撞，反弹导致跟最初的球方向相同。球就穿过砖块了
            // 看样子没办法，只能用方法2 ，暂时取消 clide bit mask ，在clide结束的时候再添回去？
        }
    }
    
    fileprivate func reflectWithNormal(_ normal:CGVector) {
        let normalAngle = atan2(normal.dy,normal.dx)
        self.reflect(CGFloat(Double.pi/2) - normalAngle)
    }
    fileprivate func reflect(_ surfaceAngle:CGFloat) {
        var angle = atan2(self.direction.dy, self.direction.dx)
        //let speed = self.bSpeedRate * Ball.speed
        //self.setVelocity(speed, angle: surfaceAngle + surfaceAngle - angle)
        let rnd = (drand48()-0.5)/10.0
        angle = angle + CGFloat(rnd)
        self.direction = CGVector(dx: cos(angle), dy: sin(angle))
        self.buffApplySpeed(rate: self.bSpeedRate)
    }
    

    
    fileprivate func setVelocity(_ speed:CGFloat,angle:CGFloat){
        self.bSpeed = speed
        self.direction = CGVector(dx: cos(angle), dy: sin(angle))
        self.physicsBody?.velocity = CGVector.zero
        self.physicsBody?.velocity = self.direction * self.bSpeed
    }
    private func buffApplySpeed(rate:CGFloat){
        self.bSpeedRate = rate
        let spd = self.direction * rate * Ball.speed
        self.physicsBody?.velocity = CGVector.zero
        //self.physicsBody?.velocity = spd
        self.physicsBody?.applyImpulse(spd)
    }
    private func buffApplyPower(power:Int){
        self.damage = power
        //TODO:- Set different visual-effects for different damanges
    }
    private func buffApplyRadius(rate:CGFloat){
        self.setScale(CGFloat(1))
        self.setScale(rate)
    }
    private func takeCareOfGeometry(pos:CGPoint){
        self.position = pos
        self.zPosition = 101
        //self.strokeColor = Ball.color
        //self.lineWidth = 1.0
        self.isAntialiased = true
        self.fillColor = UIColor.white
        self.fillTexture = SKTexture(imageNamed: "BallF")
    }
    private func takeCareOfPhysics() {
        // update: 201704 change physicsBody to triangle/rectangle , and allows rotation, trying to resolve the reflect and stick to edge problem
        //self.physicsBody = SKPhysicsBody(circleOfRadius: Ball.radius)
        /** 六边形
        let a = 0.5 * Ball.radius
        let b = 0.866 * Ball.radius
        let bound = UIBezierPath()
        bound.move(to: CGPoint(x: a, y: b))
        bound.addLine(to: CGPoint(x:Ball.radius ,y: 0))
        bound.addLine(to: CGPoint(x:a ,y: -b))
        bound.addLine(to: CGPoint(x:-a ,y: -b))
        bound.addLine(to: CGPoint(x:-Ball.radius ,y: 0))
        bound.addLine(to: CGPoint(x: -a, y: b))
        bound.close()
         */
        // 五边形
        let a = 0.951*Ball.radius
        let b = 0.309*Ball.radius
        let c = 0.809*Ball.radius
        let d = 0.588*Ball.radius
        let bound = UIBezierPath()
        bound.move(to: CGPoint(x:0,y:Ball.radius))
        bound.addLine(to: CGPoint(x:a,y:b))
        bound.addLine(to: CGPoint(x:d,y:-c))
        bound.addLine(to: CGPoint(x:-d,y:-c))
        bound.addLine(to: CGPoint(x:-a,y:b))
        bound.close()

        self.physicsBody = SKPhysicsBody(polygonFrom: bound.cgPath)
        //self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: Ball.radius*1.4, height: Ball.radius*1.4))
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.friction = 0.0
        self.physicsBody?.isDynamic = true
        self.physicsBody?.usesPreciseCollisionDetection = true
        self.physicsBody?.restitution = 1.0
        self.physicsBody?.linearDamping = 0.0
        self.physicsBody?.allowsRotation = true
        self.physicsBody?.categoryBitMask = PhysicsCategory.Ball
        self.physicsBody?.collisionBitMask = PhysicsCategory.Ball | PhysicsCategory.Brick | PhysicsCategory.Kongfu | PhysicsCategory.Boundary | PhysicsCategory.KongfuMK | PhysicsCategory.KongfuTC
        self.physicsBody?.contactTestBitMask = PhysicsCategory.Ball | PhysicsCategory.Brick | PhysicsCategory.Kongfu | PhysicsCategory.Boundary | PhysicsCategory.KongfuMK | PhysicsCategory.KongfuTC
    }
}
