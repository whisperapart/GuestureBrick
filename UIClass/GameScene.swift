//
//  GameScene.swift
//  GuestureBrick
//
//  Created by jim on 16/12/21.
//  Copyright © 2016年 Jim. All rights reserved.
//

import SpriteKit
import GameplayKit
import GoogleMobileAds
import AVFoundation

class GameScene: SKScene, SKPhysicsContactDelegate {
 
    // MARK: - Variables
    internal var actFirstPoint : CGPoint = CGPoint.zero
    internal var actTapDown : Bool = false
    internal var currentLevel : Int = 1
    internal var X = CGFloat(0.0) // cos
    internal var Y = CGFloat(0.0) // sin
    
    internal var guiHeiMax :CGFloat = 0;
    internal var guiLenMax :CGFloat = 0;
    internal let spacing = CGFloat(6.0)
    internal var bLen :CGFloat = 0  // brick length
    internal var bHei :CGFloat = 0  // brick height
    internal var topHeight:CGFloat = 40.0
    internal let gestureHeightPercent : CGFloat = 0.3
    
    internal var levelData:Level = LevelData[0]
    internal var levelArr = LevelData[0].arr
    public var effect:BMBEffectClass!
    public var balls:[BMBBall?] = [BMBBall?]()
    public var ballIndex:Int = -1
    public var isStarted : Bool = false
    public var isMovingBall: Bool = false
    public var score:Int = 0
    public var hiScore : Int = 0
    public var lastDiamondHiScore: Int = 1000
    public var nextDiamondHiScore: Int = 2000
    internal var playedTimes:Int = 1
    
    // Google AdMobs
    var bannerView: GADBannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
    
    deinit{
        self.bannerView.removeFromSuperview()
        self.effect = nil
    }
    
    internal func checkIfLevelFinished() -> Bool{
        for i in 0..<self.levelArr.count{
            for j in 0..<self.levelArr[i].count{
                if(self.levelArr[i][j] != 0){
                    return false
                }
            }
        }
        return true
    }
    
    internal func checkIfGameOver() -> Bool{
        for i in 0...self.ballIndex{
            if(self.balls[i] != nil){
                return false
            }
        }
        return true
    }
    internal func gameOver(succ:Bool = false){
        setHiScoreToHistory(hi: self.hiScore)
        setCurrentLevelToHistory(lv: self.currentLevel)
        if(succ){
            setContinueScoreToHistory(score:self.score)
            if(self.currentLevel == endlessLevel){
                self.playedTimes = self.playedTimes + 1
                self.loadLimitlessLevel(times: self.playedTimes)
                return
            }else{
                setLevelToHistory(lv: self.currentLevel + 1)
                self.sndPlay(name: "efSoundCele")
            }
        }else{
            setContinueScoreToHistory(score: 0)
            self.sndPlay(name: "efSoundFail")
        }
        
        //let reveal = SKTransition.reveal(with: SKTransitionDirection.up, duration: 1.0)
        let reveal = SKTransition.fade(withDuration: 1.0)
        let levelScene = LevelScene()
        levelScene.size = self.frame.size
        levelScene.scaleMode = .aspectFill
        self.run(SKAction.wait(forDuration: 1.3), completion: {
            self.view?.presentScene(levelScene,transition:reveal)
        })
    }
    internal func updateEffect(){
        for i in 0..<balls.count{
            let b = balls[i]
            if(b != nil){
                //b!.takeCareOfBuff(buff: self.effect)
                b!.takeCareOfBuff(speedRate: self.effect.BallSpeedRate, power: self.effect.BallPower, radiusRate: self.effect.BallRadiusRate)
            }
        }
        if(self.effect.ScoreAdd >= 0 ){
            self.score  = self.score + self.effect.ScoreAdd
            self.effect.ScoreAdd = 0
        }
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
            if arc4random_uniform(2)>0 {
                self.sndLoadSingle(nodeName: "bgSound", fileName: "bg2.caf", isBG: true)
            }else{
                self.sndLoadSingle(nodeName: "bgSound", fileName: "piano.caf", isBG: true)
            }
            self.sndLoadSingle(nodeName: "efSoundYes", fileName: "yes.wav", isBG: false)
            self.sndLoadSingle(nodeName: "efSoundFail", fileName: "fail.caf", isBG: false)
            self.sndLoadSingle(nodeName: "efSoundCele", fileName: "cele.caf")
            
            self.sndLoadSingle(nodeName: "efSoundVibra1", fileName: "vibra1.caf")
            self.sndLoadSingle(nodeName: "efSoundVibra2", fileName: "vibra2.caf")
            self.sndLoadSingle(nodeName: "efSoundVibra3", fileName: "vibra3.caf")
            self.sndLoadSingle(nodeName: "efSoundVibra4", fileName: "vibra4.caf")
            self.sndLoadSingle(nodeName: "efSoundVibra5", fileName: "vibra5.caf")
            self.sndLoadSingle(nodeName: "efSoundVibra6", fileName: "vibra6.caf")
            self.sndLoadSingle(nodeName: "efSoundVibra7", fileName: "vibra7.caf")
            self.sndLoadSingle(nodeName: "efSoundVibra8", fileName: "vibra8.caf")
            
            let kf = getCurrentPadFromHistory()
            switch(kf.rawValue){
                case KongFu.Fist.rawValue:
                    self.sndLoadSingle(nodeName: "efSoundKF", fileName: "vibra\(arc4random_uniform(8)+1).caf")
                    break
                case KongFu.Tiger.rawValue:
                    self.sndLoadSingle(nodeName: "efSoundKF", fileName: "tiger25.wav")
                    break
                case KongFu.Crane.rawValue:
                    self.sndLoadSingle(nodeName: "efSoundKF", fileName: "crane30.wav")
                break
                case KongFu.Snake.rawValue:
                    self.sndLoadSingle(nodeName: "efSoundKF", fileName: "snake50.wav")
                break
                case KongFu.Monkey.rawValue:
                    self.sndLoadSingle(nodeName: "efSoundKF", fileName: "monkey60.wav")
                break
                case KongFu.Dragon.rawValue:
                    self.sndLoadSingle(nodeName: "efSoundKF", fileName: "dragon50.wav")
                break
                case KongFu.Qi.rawValue:
                    self.sndLoadSingle(nodeName: "efSoundKF", fileName: "qi45.wav")
                break
                case KongFu.TaiChi.rawValue:
                    self.sndLoadSingle(nodeName: "efSoundKF", fileName: "taichi45.wav")
                break
                default:
                    self.sndLoadSingle(nodeName: "efSoundKF", fileName: "vibra\(arc4random_uniform(8)+1).caf")
                break
            }
        }
    }
    
    internal func sndPlay(name:String){
        guard let sd = self.childNode(withName: name) else {return}
        sd.run(SKAction.stop())
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
    internal func sndPlayVibra(){
        sndPlay(name: "efSoundVibra\(arc4random_uniform(8)+1)")
    }
    internal func sndPlayKongFu(){
        sndPlay(name: "efSoundKF")
    }
}
