//
//  levelScene.swift
//  GuestureBrick
//
//  Created by jim on 2017/5/2.
//  Copyright © 2017年 Jim. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation

// Level starts from 1
class LevelScene: SKScene {
    internal var guiLenMax :CGFloat  = 0.0
    internal var guiHeiMax :CGFloat  = 0.0
    internal var guiCell :CGFloat    = 0.0
    
    internal var actFirstPoint = CGPoint.zero

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
            self.sndLoadSingle(nodeName: "bgSound", fileName: "bg3.m4a", isBG: true)
            self.sndLoadSingle(nodeName: "efSoundYes", fileName: "yes.wav", isBG: false)
        }
    }
    
    internal func sndPlay(name:String){
        guard let sd = self.childNode(withName: name) else {return}
        sd.run(SKAction.stop())
        //let act = SKAction.group([SKAction.play(),SKAction.wait(forDuration: 0.3)])
        sd.run(SKAction.play())
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
    }
}
