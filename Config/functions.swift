//
//  Extensions.swift
//  GuestureBrick
//
//  Created by jim on 16/12/21.
//  Copyright © 2016年 Jim. All rights reserved.
//

import SpriteKit

//Mark: - Extensions

extension UIColor {
    convenience init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.characters.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

extension CGPoint {
    func length() -> CGFloat {
        return sqrt(x*x + y*y)
    }
    func normalized() -> CGPoint {
        return self / length()
    }
}

extension SKAction {
    class func shake(duration:CGFloat, amplitudeX:Int = 3, amplitudeY:Int = 3) -> SKAction {
        let numberOfShakes = duration / 0.015 / 2.0
        var actionsArray:[SKAction] = []
        for _ in 1...Int(numberOfShakes) {
            let dx = CGFloat(arc4random_uniform(UInt32(amplitudeX))) - CGFloat(amplitudeX / 2)
            let dy = CGFloat(arc4random_uniform(UInt32(amplitudeY))) - CGFloat(amplitudeY / 2)
            let forward = SKAction.moveBy(x: dx, y: dy, duration: 0.015)
            let reverse = forward.reversed()
            actionsArray.append(forward)
            actionsArray.append(reverse)
        }
        return SKAction.sequence(actionsArray)
    }
}

//Mark: - Global Funcs
func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}
func - (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}
func * (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x * scalar, y: point.y * scalar)
}
func / (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x / scalar, y: point.y / scalar)
}
func * (vect:CGVector, scalar: CGFloat) -> CGVector {
    return CGVector(dx: vect.dx * scalar, dy: vect.dy * scalar)
}

#if !(arch(x86_64) || arch(arm64))
    func sqrt(a: CGFloat) -> CGFloat {
        return CGFloat(sqrtf(Float(a)))
    }
#endif

//Mark: - Global Funcs - game settings related
func getSoundSetting() -> Bool{
    let isSoundOn = UserDefaults.standard.value(forKey: ConfigKeys.isSoundEffectOn)
    if(isSoundOn != nil){
        return isSoundOn as! Bool
    }else{
        return true
    }
}
func setSound(isOn:Bool){
    UserDefaults.standard.setValue(isOn, forKey: ConfigKeys.isSoundEffectOn)
}

func getLevelFromHistory() -> Int{
    let currentLevel = UserDefaults.standard.value(forKey: ConfigKeys.level)
    if(currentLevel != nil){
        return currentLevel as! Int
    }else{
        return 1
    }
}
func setLevelToHistory(lv:Int){
    UserDefaults.standard.setValue(lv, forKey: ConfigKeys.level)
}

func getHiScoreFromHistory()->Int{
    var y = UserDefaults.standard.value(forKey: ConfigKeys.HiScore)
    if(y == nil){
        y = ConfigKeys.HiScoreDefault
        setHiScoreToHistory(hi: ConfigKeys.HiScoreDefault)
        y = 0
    }
    return y as! Int
}
func setHiScoreToHistory(hi:Int){
    let y = UserDefaults.standard.value(forKey: ConfigKeys.HiScore)
    if(y==nil){
        UserDefaults.standard.setValue(ConfigKeys.HiScoreDefault, forKey: ConfigKeys.HiScore)
    }else{
        let x = y as! Int
        if(x<hi){
            UserDefaults.standard.setValue(hi, forKey: ConfigKeys.HiScore)
        }
    }
}

func getStarsFromHistory() -> Int{
    var y = UserDefaults.standard.value(forKey: ConfigKeys.strStarNumber)
    if(y == nil){
        y = ConfigKeys.defaultStars
        setStarsToHistory(star: y as! Int)
    }
    return y as! Int
}
func setStarsToHistory(star:Int){
    UserDefaults.standard.setValue(star, forKey: ConfigKeys.strStarNumber)
}

func getCurrentLevelFromHistory() -> Int{
    var y = UserDefaults.standard.value(forKey: ConfigKeys.strCurrentLevel)
    if(y == nil){
        y = ConfigKeys.defaultCurrentLevel
        setCurrentLevelToHistory(lv: y as! Int)
    }
    return y as! Int
}
func setCurrentLevelToHistory(lv:Int){
    UserDefaults.standard.setValue(lv, forKey: ConfigKeys.strCurrentLevel)
}

func getCurrentPadFromHistory() -> KongFu{
    var y = UserDefaults.standard.value(forKey: ConfigKeys.strCurrentPad)
    if(y == nil){
        y = ConfigKeys.defaultPad
        setCurrentPadToHistory(kfraw:y as! Int)
    }
    let x = y as! Int
    switch(x){
    case KongFu.Fist.rawValue:
        return KongFu.Fist
    case KongFu.Tiger.rawValue:
        return KongFu.Tiger
    case KongFu.Crane.rawValue:
        return KongFu.Crane
    case KongFu.Snake.rawValue:
        return KongFu.Snake
    case KongFu.Monkey.rawValue:
        return KongFu.Monkey
    case KongFu.Dragon.rawValue:
        return KongFu.Dragon
    case KongFu.Qi.rawValue:
        return KongFu.Qi
    case KongFu.TaiChi.rawValue:
        return KongFu.TaiChi
    default:
        return KongFu.Fist
    }
}
func setCurrentPadToHistory(kfraw:Int){
    UserDefaults.standard.setValue(kfraw, forKey: ConfigKeys.strCurrentPad)
}

func checkIfKongFuPurchased(kfRaw:Int) -> Bool{
    var y = UserDefaults.standard.value(forKey: ConfigKeys.strCurrentInventory)
    if(y == nil){
        y = ConfigKeys.defaultUserInventory
        setCurrentInventoryToHistory(inv: y as! Int)
    }
    let kfMask = 0b1 << kfRaw
    let ret = (y as! Int) & kfMask
    let res = ret != 0 ? true : false
    return res
}
func setCurrentInventoryToHistory(inv:Int){
    UserDefaults.standard.setValue(inv, forKey: ConfigKeys.strCurrentInventory)
}
func purchaseKongFu(kf:KongFu){
    let kfMask = 0b1 << kf.rawValue
    var y = UserDefaults.standard.value(forKey: ConfigKeys.strCurrentInventory)
    if(y == nil){
        y = ConfigKeys.defaultUserInventory
    }
    let res = (y as! Int) | kfMask
    UserDefaults.standard.setValue(res, forKey: ConfigKeys.strCurrentInventory)
}

func setContinueScoreToHistory(score:Int){
    UserDefaults.standard.setValue(score, forKey: ConfigKeys.strContinueScore)
}
func getContinueScoreFromHistory() -> Int{
    var y = UserDefaults.standard.value(forKey: ConfigKeys.strContinueScore)
    if(y == nil){
        y = 0
        setContinueScoreToHistory(score: 0)
    }
    return y as! Int
}

func setAdMobStatusToHistory(isRemoved:Bool){
    UserDefaults.standard.setValue(isRemoved, forKey: ConfigKeys.strADMobFlag)
}
func getAdMobStatusFromHistory() -> Bool{
    var y = UserDefaults.standard.value(forKey: ConfigKeys.strADMobFlag)
    if(y == nil){
        y = ConfigKeys.defaultADMobStatus
        //y = false
        setAdMobStatusToHistory(isRemoved: y as! Bool)
    }
    return y as! Bool
}



