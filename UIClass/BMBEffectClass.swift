//
//  BMBBuffClass.swift
//  GuestureBrick
//
//  Created by jim on 16/12/24.
//  Copyright © 2016年 Jim. All rights reserved.
//

import SpriteKit

class BMBEffectClass{
    public var BallSpeedRate:CGFloat = 1.0
    public var BallPower:Int = 1
    public var BallRadiusRate:CGFloat = 1.0
    public var PadWidthRate:CGFloat = 1.0
    public var ScoreAdd:Int = 0
    
    public func applyBuff(buff:BuffEffect){
        switch(buff){
        case BuffEffect.BigBall: self.bigBall()
        case BuffEffect.SmallBall: self.smallBall()
        case BuffEffect.FastBall: self.fastBall()
        case BuffEffect.SlowBall: self.slowBall()
        case BuffEffect.PowerBall: self.powerBall()
        case BuffEffect.WeakBall: self.weakBall()
        //case BuffEffect.WidePad: self.widePad()
        //case BuffEffect.NarrowPad: self.narrowPad()
        case BuffEffect.Diamond: self.ScoreAdd = BuffValue.Diamond
        //case Buff.StickPad: self.pause()
        default:break
        }
    }
    
    public func powerBall(){
        let p = self.BallPower + BuffValue.PowerBall
        self.BallPower = p>BuffValue.PowerBallMax ? BuffValue.PowerBallMax : p
        self.ScoreAdd = BuffValue.Score
    }
    public func weakBall(){
        let p = self.BallPower - BuffValue.WeakBall
        self.BallPower = p<BuffValue.WeakBallMax ? BuffValue.WeakBallMax : p
        self.ScoreAdd = BuffValue.Score
    }
    
    public func fastBall(){
        let s = self.BallSpeedRate + BuffValue.FastBall
        self.BallSpeedRate = s>BuffValue.FastBallMax ? BuffValue.FastBallMax : s
        self.ScoreAdd = BuffValue.Score
    }
    public func slowBall(){
        let s = self.BallSpeedRate - BuffValue.SlowBall
        self.BallSpeedRate = s<BuffValue.SlowBallMax ? BuffValue.SlowBallMax : s
        self.ScoreAdd = BuffValue.Score
    }
    
    public func bigBall(){
        let r = self.BallRadiusRate + BuffValue.BigBall
        self.BallRadiusRate = r>BuffValue.BigBallMax ? BuffValue.BigBallMax : r
        self.ScoreAdd = BuffValue.Score
    }
    public func smallBall(){
        let r = self.BallRadiusRate - BuffValue.SmallBall
        self.BallRadiusRate = r<BuffValue.SmallBallMax ? BuffValue.SmallBallMax : r
        self.ScoreAdd = BuffValue.Score
    }
    /*
    public func widePad(){
        let w = self.PadWidthRate + BuffValue.WidePad
        self.PadWidthRate = w>BuffValue.WidePadMax ? BuffValue.WidePadMax : w
    }
    public func narrowPad(){
        let w = self.PadWidthRate - BuffValue.NarrowPad
        self.PadWidthRate = w<BuffValue.NarrowPadMax ? BuffValue.NarrowPadMax : w
    }
     */
    
    
}
