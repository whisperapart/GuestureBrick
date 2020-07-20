//
//  BMBBrickClass.swift
//  GuestureBrick
//
//  Created by jim on 16/12/27.
//  Copyright © 2016年 Jim. All rights reserved.
//

import SpriteKit

/*****
 *  The Brick Class
 *  Update-201704   remove the shadow sprite
 */

class BMBBrick : SKSpriteNode{
    public var hitPoint:Int = 1
    internal var dropRate = Brick.dropRate
    internal var clr = UIColor.clear
    
    init(x:CGFloat,y:CGFloat,bLen:CGFloat,bHei:CGFloat,row:Int,col:Int,brickType:Int){
        let colorTypes = BrickType.count
        
        if brickType >= colorTypes{
            self.clr = BrickType[colorTypes-1]
        }else{
            self.clr = BrickType[brickType]
        }
        
        self.hitPoint = brickType
        let bSize = CGSize(width: bLen, height: bHei)
        let bTxt = SKTexture(imageNamed: "BrickF")
        super.init(texture:bTxt, color: clr, size: bSize)
        self.colorBlendFactor = 1.0
        self.color = clr
        self.anchorPoint = CGPoint(x:0.0,y:1.0)
        self.position = CGPoint(x:x,y:y)
        self.name = "brick-\(row)-\(col)"
        self.physicsBody = SKPhysicsBody(rectangleOf: bSize, center: CGPoint(x:bLen/2.0,y:-bHei/2.0))
        self.takeCareOfPhysics()
        
        let label = SKLabelNode(fontNamed: "chalkduster")
        label.text = "\(self.hitPoint)"
        label.fontSize = bHei/2
        label.name = "hitPoint"
        label.fontColor = UIColor.black
        label.position = CGPoint(x:bLen/2,y:-bHei*0.75)
        label.zPosition = 103
        self.addChild(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    internal func updateBrickHitPoint(){
        guard let hpn = self.childNode(withName: "hitPoint") else {return}
        let labelnode = hpn as! SKLabelNode
        labelnode.text = "\(self.hitPoint)"
        
    }
    
    internal func takeCareOfPhysics(){
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.friction = 1.0
        self.physicsBody?.isDynamic = false
        self.physicsBody?.usesPreciseCollisionDetection = true;
        self.physicsBody?.restitution = 1.0
        self.physicsBody?.linearDamping = 0.0
        self.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        self.physicsBody?.collisionBitMask = PhysicsCategory.Ball
        self.physicsBody?.contactTestBitMask = PhysicsCategory.Ball
    }
    internal func dropItem(){
        let num = CGFloat(arc4random_uniform(100))/CGFloat(100.0)
        if(self.dropRate >= num){
            let t = arc4random_uniform(7) // 0 ~ 6
            let dt = BuffEffect(rawValue: Int(t))
            let centr = CGPoint(x: self.position.x+self.size.width/2.0, y: self.position.y-self.size.height/2.0)
            let dropItem = BMBBuffSprite(type: dt!, pos: centr, w: self.size.height)
            //(self.scene as! GameScene).drops.append(dropItem)
            (self.parent as! SKShapeNode).addChild(dropItem)
        }
    }
    
    public func hit(dmg:Int,normal:CGVector) -> Int{
        self.hitPoint = self.hitPoint - dmg
        if(self.hitPoint <= 0) {
            self.dropItem()
            self.physicsBody = nil
            self.hitExplode(normal:normal)
            return 0
        }else{
            self.hitShake()
            self.dropRate = self.dropRate + Brick.dropIncreasePerHit
            self.updateBrickHitPoint()
            return self.hitPoint
        }
    }
    
    internal func hitExplode(normal:CGVector){
        // this func removes the current brick and create dozens of small blocks drop into the gamescene with mass and gravity, disappears in 2 seconds
        let w = self.frame.size.width
        let h = self.frame.size.height
        /*
        let bw = CGFloat(5.0)
        let bh = CGFloat(5.0)
        var rows = Int(floor(h/bh))
        var cols = Int(floor(w/bw))
        rows = rows>=4 ? 4 : rows
        cols = cols>=5 ? 5 : cols
         */
        let rows:Int = 5
        let cols:Int = 6
        let x1 = floor(w/CGFloat(cols))
        let x2 = floor(h/CGFloat(rows))
        let b = x1<x2 ? x1 : x2

        let myleftbottom = CGPoint(x:self.position.x,y:self.position.y-self.frame.height)
        for i in 0..<rows{
            for j in 0..<cols{
                //let rect = CGRect(x: myleftbottom.x+CGFloat(j)*bw+1, y: myleftbottom.y+CGFloat(i)*bh+1, width: bw, height: bh)
                let size = CGSize(width: b, height: b)
                let block = SKSpriteNode(color: self.clr, size: size)
                block.position = CGPoint(x:myleftbottom.x+CGFloat(j)*b+1,y :myleftbottom.y+CGFloat(i)*b+1)
                
                block.physicsBody = SKPhysicsBody(rectangleOf: size)
                block.physicsBody?.affectedByGravity = true
                block.physicsBody?.mass = 0.1
                block.physicsBody?.friction = 0.0
                block.physicsBody?.isDynamic = true
                block.physicsBody?.usesPreciseCollisionDetection = false;
                block.physicsBody?.restitution = 1.0
                block.physicsBody?.linearDamping = 0.0
                block.physicsBody?.categoryBitMask = PhysicsCategory.BrickShades
                block.physicsBody?.collisionBitMask = PhysicsCategory.Boundary
                block.physicsBody?.contactTestBitMask = PhysicsCategory.Boundary
                // PhysicsCategory.Brick | PhysicsCategory.BrickShades |
                
                (self.parent as! SKShapeNode).addChild(block)
                let x = CGFloat(Float(arc4random()) / Float(UINT32_MAX)) - 0.5
                let y = CGFloat(Float(arc4random()) / Float(UINT32_MAX)) - 0.5
                let spd = CGVector(dx: 8*(2*x-normal.dx), dy: 2*(2*y-normal.dy))
                block.physicsBody?.applyImpulse(spd)

            }
        }
        self.removeFromParent()
        
        
    }
    
    internal func hitShake(){
        let shakeAction = SKAction.shake(duration: 0.3, amplitudeX: 5, amplitudeY: 5)
        self.run(shakeAction)
    }
    
    internal func hitShake(restoreColor:UIColor,soundFileName:String,block:@escaping()->Void){
        let shakeAction = SKAction.shake(duration: 0.3, amplitudeX: 5, amplitudeY: 5)
        //let blinkAction = SKAction.colorize(with: blinkColor, colorBlendFactor: 1.0, duration: 0.3)
        let colorAction = SKAction.colorize(with: restoreColor, colorBlendFactor: 1.0, duration: 0)
        //let colorAction = SKAction.sequence([blinkAction,restoreAction])
        let actSeq = SKAction.group([shakeAction,colorAction])
        
        self.run(actSeq,completion:{
            block()
        })
        
    }
}


/*
 
 
 internal func updateBrickColor(clr:UIColor){
 self.color = clr
 }
class BMBBrick_OLD : SKSpriteNode{
    public var hitPoint:Int = 1
    internal var dropRate = Brick.dropRate
    internal var clr = UIColor.clear
    internal var brickBodySprite = SKSpriteNode()
    internal var brickShadowSprite = SKSpriteNode()
    
    init(x:CGFloat,y:CGFloat,bLen:CGFloat,bHei:CGFloat,brickType:Int){
        self.clr = BrickType[brickType]
        self.hitPoint = brickType
        let bSize = CGSize(width: bLen, height: bHei)
        //super.init(texture:nil, color: clr, size: bSize)
        super.init(texture:nil, color: UIColor.clear, size: bSize)
        //self.colorBlendFactor = 1.0
        //self.color = clr
        //let txt = SKTexture(imageNamed: "Spaceship")
        //super.init(texture:txt,color:clr,size:bSize)
        self.anchorPoint = CGPoint(x:0.0,y:1.0)
        self.position = CGPoint(x:x,y:y)
        self.name = "brick-\(x)-\(y)"
        self.physicsBody = SKPhysicsBody(rectangleOf: bSize, center: CGPoint(x:bLen/2.0,y:-bHei/2.0))
        self.takeCareOfPhysics()
        
        self.initBrickBodySprite(clr: clr, bSize: bSize)
        //self.initBrickShadowSprite(bSize: bSize)
        self.addChild(self.brickBodySprite)
        //self.addChild(self.brickShadowSprite)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func updateBrickColor(clr:UIColor){
        self.brickBodySprite.color = clr
    }
    
    internal func initBrickBodySprite(clr:UIColor,bSize:CGSize){
        //self.brickBodySprite = SKSpriteNode(color: clr, size: bSize)
        let txt = SKTexture(imageNamed: "BrickE")
        self.brickBodySprite = SKSpriteNode(texture: txt, color: UIColor.white, size: bSize)
        self.brickBodySprite.colorBlendFactor = 1.0
        self.brickBodySprite.color = clr
        self.brickBodySprite.anchorPoint = CGPoint(x:0.0,y:1.0)
        self.brickBodySprite.position = CGPoint(x:0.0,y:0.0)
        self.brickBodySprite.zPosition = 10
    }
    internal func initBrickShadowSprite(bSize:CGSize){
        self.brickShadowSprite = SKSpriteNode(color:Brick.shadowColor,size:bSize)
        self.brickShadowSprite.anchorPoint = CGPoint(x:0.0,y:1.0)
        self.brickShadowSprite.position = CGPoint(x:1.1,y:-1.168)
        self.brickShadowSprite.zPosition = 9;
    }
    internal func takeCareOfPhysics(){
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.friction = 1.0
        self.physicsBody?.isDynamic = false
        self.physicsBody?.usesPreciseCollisionDetection = true;
        self.physicsBody?.restitution = 1.0
        self.physicsBody?.linearDamping = 0.0
        self.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        self.physicsBody?.collisionBitMask = PhysicsCategory.Ball
        self.physicsBody?.contactTestBitMask = PhysicsCategory.Ball
    }
    internal func dropItem(){
        let num = CGFloat(arc4random_uniform(100))/CGFloat(100.0)
        if(self.dropRate >= num){
            let t = arc4random_uniform(10) // 0 ~ 9
            let dt = BuffEffect(rawValue: Int(t))
            let centr = CGPoint(x: self.position.x+self.size.width/2.0, y: self.position.y-self.size.height/2.0)
            let dropItem = BMBBuffSprite(type: dt!, pos: centr, w: self.size.height)
            //(self.scene as! GameScene).drops.append(dropItem)
            (self.parent as! SKShapeNode).addChild(dropItem)
        }
    }
    
    public func hit(dmg:Int){
        self.hitPoint = self.hitPoint - dmg
        if(self.hitPoint <= 0) {
            // destroy self
            self.dropItem()
            self.physicsBody = nil
            self.run(SKAction.fadeOut(withDuration: 0.3), completion: {
            //self.run(SKAction.shake(duration: 0.3, amplitudeX: 5, amplitudeY: 5), completion: {
                self.removeFromParent()
            })
            // should I drop something?
        }else{
            // change color
            self.updateBrickColor(clr: BrickType[self.hitPoint])
            self.run(SKAction.shake(duration: 0.5, amplitudeX: 5, amplitudeY: 5))
            self.dropRate = self.dropRate + Brick.dropIncreasePerHit
        }
    }
    
}
 */
