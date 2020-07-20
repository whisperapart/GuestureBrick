//
//  menuScene.swift
//  GuestureBrick
//
//  Created by jim on 2017/5/2.
//  Copyright © 2017年 Jim. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation

class MenuScene: SKScene {
    internal var guiLenMax :CGFloat     = 0.0
    internal var guiHeiMax :CGFloat     = 0.0
    //internal let guiColSpacing :CGFloat = CGFloat(0.5)
    //internal var guiColLen :CGFloat     = 0
    //internal var guiColHei :CGFloat     = 0
    
    internal var actFirstPoint = CGPoint.zero
    
    private var sndNameArr = [String]()
    private func sndLoadSingle(nodeName:String,fileName:String,isBG:Bool = false){
        if sndNameArr.contains(nodeName) {
            return
        }
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
        sndNameArr.append(nodeName)
    }
    
    internal func sndLoad(){
        self.sndClear()
        self.sndLoadSingle(nodeName: "bgSound", fileName: "bg3.m4a", isBG: true)
        //self.sndLoadSingle(nodeName: "bgSound", fileName: "piano.caf", isBG: true)
        self.sndLoadSingle(nodeName: "efSoundYes", fileName: "yes.wav", isBG: false)
    }
    
    internal func sndClear(){
        for name in sndNameArr {
            guard let node = self.childNode(withName: name) else {continue}
            node.removeFromParent()
        }
        sndNameArr.removeAll()
    }
    
    internal func sndPlay(name:String){
        guard let sd = self.childNode(withName: name) else {return}
        if(getSoundSetting()){
            sd.run(SKAction.stop())
            sd.run(SKAction.play())
        }
    }
    internal func sndStop(name:String){
        guard let sd = self.childNode(withName: name) else {return}
        sd.run(SKAction.stop())
    }
    internal func sndPause(name:String){
        guard let sd = self.childNode(withName: name) else {return}
        sd.run(SKAction.pause())
    }
    
    deinit{
        sndNameArr.removeAll()
    }
}
