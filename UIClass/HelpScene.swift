//
//  HelpScene.swift
//  GuestureBrick
//
//  Created by jim on 2017/5/30.
//  Copyright © 2017年 Jim. All rights reserved.
//

import SpriteKit

class HelpScene: SKScene {
    internal var guiLenMax:CGFloat = 0.0
    internal var guiHeiMax:CGFloat = 0.0
    weak var scrollView: SwiftySKScrollView?
    internal var actFirstPoint = CGPoint.zero
    
    deinit{
        self.scrollView?.removeFromSuperview()
    }
    
    override func didMove(to view: SKView) {
        self.guiLenMax = self.frame.width
        self.guiHeiMax = self.frame.height
        
        self.guiDrawMenu()
        self.guiDrawInventory()
        self.sndLoad()
    }
    
    internal func guiDrawMenu(isActive:Bool=false){
        self.removeChildren(name: "bkBtn-1")
        self.removeChildren(name: "bkBtn-2")
        
        let mcell = self.guiLenMax/12
        let bSize = CGSize(width: mcell*1.618, height: mcell)
        let txtName = isActive ? "arr-left-2-fill" : "arr-left-2"
        let bTxt = SKTexture(imageNamed: txtName)
        let bkNode = SKSpriteNode(texture:bTxt, color: UIColor.white, size: bSize)
        bkNode.position = CGPoint(x:mcell*1.5,y:self.guiHeiMax-mcell*2)
        bkNode.colorBlendFactor = 1.0
        bkNode.color = BrickColor.dkRed
        bkNode.name = "bkBtn-1"
        bkNode.zRotation = CGFloat(-Double.pi/2)
        bkNode.zPosition = 123
        self.addChild(bkNode)
        
        let bkDiv = SKSpriteNode(color: UIColor.clear, size: CGSize(width:mcell*2,height:mcell*2))
        bkDiv.position = CGPoint(x:1.5*mcell, y:self.guiHeiMax-2*mcell)
        bkDiv.name = "bkBtn-2"
        bkDiv.zPosition = 102
        self.addChild(bkDiv)
    }
    
    internal func guiDrawInventory(){
        let moveableNode = SKNode()
        moveableNode.name = "moveableNode"
        moveableNode.zPosition = 1
        self.addChild(moveableNode)
        
        // set up scrollView
        scrollView = SwiftySKScrollView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height), moveableNode: moveableNode, direction: .horizontal)
        
        guard let scrollView = scrollView else { return }
        
        scrollView.center = CGPoint(x: frame.midX, y: frame.midY)
        let cnt = splashArr.count
        scrollView.contentSize = CGSize(width: scrollView.frame.width*CGFloat(cnt), height: scrollView.frame.height)
        // * 3 makes it 3times as long as screen
        //scrollView.scrollIndicatorInsets = UIEdgeInsets(top: scrollView.frame.height-10, left: 0, bottom: 0, right: 0)
        view?.addSubview(scrollView)
        scrollView.setContentOffset(CGPoint(x: 0 + frame.width * CGFloat(cnt-1), y: 0), animated: true)
        
        // ScrollView Sprites for each page in scrollView
        // Makes positioning much easier.
        for i in 1...splashArr.count {
            let pageScroll = self.guiDrawSplash(index: i)
            moveableNode.addChild(pageScroll)
        }
    }
    
    func guiDrawSplash(index:Int) -> BMBSplash {
        let spNode = BMBSplash(title: "Tips: - \(index)", widMax: guiLenMax, heiMax: guiHeiMax, imageNamed: splashArr[index-1],zoom:0.9)
        let x = self.frame.midX - CGFloat(splashArr.count - index) * guiLenMax
        spNode.position = CGPoint(x:x,y:self.frame.midY)
        spNode.name = "scrollPage-\(index)"
        return spNode
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            self.actFirstPoint = touch.location(in: self)
        }
        let touchedNodes = self.nodes(at: self.actFirstPoint)
        if(touchedNodes.count > 0){
            for tn in touchedNodes{
                let n = tn.name
                if(n == nil){
                    continue
                }else{
                    let name = n!
                    let nameArr = name.components(separatedBy: "-")
                    switch(nameArr[0]){
                    case "bkBtn":
                        self.actBackBtn()
                        break
                    default:
                        break
                    }
                }
            }
        }
    }
    
    private func removeChildren(name:String){
        guard let c = self.childNode(withName: name) else {return}
        c.removeFromParent()
    }
    
    internal func actBackBtn(){
        self.sndPlay(name: "efSoundYes")
        let slide = SKTransition.push(with: SKTransitionDirection.down, duration: 1.0)
        let menuScene = MenuScene()
        menuScene.size = self.frame.size
        menuScene.scaleMode = .aspectFill
        
        self.guiDrawMenu(isActive: true)
        self.run(SKAction.wait(forDuration: 0.3), completion: {
            self.view?.presentScene(menuScene,transition:slide)
        })
    }
    private func sndLoadSingle(nodeName:String,fileName:String,isBG:Bool = false){
        let sound = SKAudioNode(fileNamed: fileName)
        if getSoundSetting() {
            sound.autoplayLooped = isBG
        }else{
            sound.autoplayLooped = false
        }
        sound.isPositional = false
        sound.name = nodeName
        sound.avAudioNode?.engine?.prepare()
        self.addChild(sound)
    }
    
    internal func sndLoad(){
        if getSoundSetting() {
            self.sndLoadSingle(nodeName: "efSoundYes", fileName: "yes.wav", isBG: false)
        }
    }
    
    internal func sndPlay(name:String){
        guard let sd = self.childNode(withName: name) else {return}
        sd.run(SKAction.stop())
        sd.run(SKAction.play())
    }
}
