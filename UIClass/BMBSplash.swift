//
//  BMBSplash.swift
//  GuestureBrick
//
//  Created by jim on 2017/5/2.
//  Copyright © 2017年 Jim. All rights reserved.
//

import SpriteKit

class BMBSplash : SKSpriteNode{
    
    override init(texture:SKTexture?, color: UIColor, size: CGSize){
        super.init(texture:texture, color: color, size: size)
    }
    
    init(title:String,widMax:CGFloat,heiMax:CGFloat,imageNamed:String,zoom:CGFloat){
        let vRect = CGRect(x: -widMax/2, y:-heiMax/2, width: widMax, height: heiMax)
        let bgLayer = SKShapeNode(rect: vRect)
        bgLayer.name = "bgLayer"
        bgLayer.strokeColor = UIColor.clear
        bgLayer.fillColor = UIColor.white
        bgLayer.fillTexture = SKTexture(imageNamed: "bg-4")
        bgLayer.zPosition = 1
        
        
        let txNode = SKLabelNode(fontNamed: "Papyrus")
        txNode.text = title
        txNode.fontColor = BrickColor.dkRed
        txNode.position = CGPoint(x:0,y:0.3*heiMax)
        txNode.zPosition = 2
        
        let imgWidMax = zoom*widMax
        let imgHeiMax = zoom*heiMax
        let spImg = UIImage(named: imageNamed)
        let imgWid = (spImg?.size.width)!
        let imgHei = (spImg?.size.height)!
        let scaleW = imgWidMax/imgWid
        let scaleH = imgHeiMax/imgHei
        let scale = min(scaleW,scaleH)
        let textureW = imgWid * scale
        let textureH = imgHei * scale
        let imgSize = CGSize(width: textureW, height: textureH)
        UIGraphicsBeginImageContextWithOptions(imgSize, false, 0.0)
        spImg?.draw(in: CGRect(x: 0, y: 0, width: textureW, height: textureH))
        let newImg = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let spTxt = SKTexture(image: newImg!)
        let spNode = SKSpriteNode(texture: spTxt)
        spNode.position = CGPoint(x: 0, y: 0)
        spNode.zPosition = 2
        
        
        super.init(texture: nil, color: UIColor.black, size: CGSize(width:widMax,height:heiMax))
        //super.init(texture:SKTexture(imageNamed: "Board"),color:UIColor.gray,size:CGSize(width:widMax,height:heiMax))
        self.zPosition = 99
        self.position = CGPoint(x:widMax/2,y:heiMax/2)
        self.addChild(bgLayer)
        self.addChild(spNode)
        self.addChild(txNode)
    }
    
    
    
    init(title:String,lenMax:CGFloat,heiMax:CGFloat,imageNamed:String){
        let txNode = SKLabelNode(fontNamed: "Papyrus")
        txNode.text = title
        txNode.fontColor = BrickColor.dkRed
        txNode.position = CGPoint(x:0,y:heiMax/5)
        
        let spImg = UIImage(named: imageNamed)
        let targetWidthMax = lenMax*2.0/3.0
        var imgSize = spImg?.size
        if(targetWidthMax<(spImg?.size.width)!){
            // need to compress it
            let scale = targetWidthMax/(spImg?.size.width)!
            imgSize = CGSize(width:targetWidthMax,height:scale*(spImg?.size.height)!)
        }
        UIGraphicsBeginImageContextWithOptions(imgSize!, false, 0.0)
        spImg?.draw(in: CGRect(x: 0, y: 0, width: (imgSize?.width)!, height: (imgSize?.height)!))
        let newImg = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let spTxt = SKTexture(image: newImg!)
        let spNode = SKSpriteNode(texture: spTxt)
        spNode.position = CGPoint(x: 0, y: -heiMax/5)
        
        super.init(texture: nil, color: UIColor.black, size: CGSize(width:lenMax,height:heiMax))
        self.zPosition = 999
        self.position = CGPoint(x:lenMax/2,y:heiMax/2)
        self.addChild(spNode)
        self.addChild(txNode)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func fire(){
        let acStay = SKAction.move(to: self.position, duration: 2)
        let acFade = SKAction.fadeOut(withDuration: 2)
        
        self.run(SKAction.sequence([acStay,acFade]),completion: {
            self.removeFromParent()
        })
    }
    
}
