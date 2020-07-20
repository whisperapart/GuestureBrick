//
//  config.swift
//  GuestureBrick
//
//  Created by jim on 16/12/23.
//  Copyright © 2016年 Jim. All rights reserved.
//

import SpriteKit

let splashArr = ["splash-1","splash-2","splash-3","splash-tiger","splash-crane","splash-snake","splash-monkey","splash-dragon","splash-qi","splash-taichi"]

struct Ball{
    static let radius = UIDevice.current.userInterfaceIdiom == .pad ? CGFloat(7.0) : CGFloat(4.0)
    static let speed = UIDevice.current.userInterfaceIdiom == .pad ? CGFloat(1.5) : CGFloat(0.3)
    static let damage = Int(1)
    static let color = BrickColor.stone
    static let spacing = CGFloat(6.0)
}
struct Brick{
    static let shadowColor = UIColor.gray
    static let dropRate:CGFloat = 0.16
    static let dropIncreasePerHit:CGFloat = 0.04
}

enum BuffEffect: Int{
    //case BigBall=0,SmallBall,FastBall,SlowBall,PowerBall,WeakBall,WidePad,NarrowPad,StickPad,Diamond
    case BigBall=0,SmallBall,FastBall,SlowBall,PowerBall,WeakBall,Diamond
}
let BuffStrArr = [FontAwesome.arrowsAlt,FontAwesome.compress,FontAwesome.rocket,FontAwesome.paperPlane,FontAwesome.plusCircle,FontAwesome.minusCircle,FontAwesome.star]
let BuffColorArr = [BrickColor.green,BrickColor.pink,BrickColor.pink,BrickColor.green,BrickColor.green,BrickColor.pink,BrickColor.blue]

struct ConfigKeys{
    static let brickHPMax = 20
    static let maxBallsInGame = 5
    static let HiScore = "HiScore"
    static let HiScoreDefault = 1000
    static let scoreToDiamond = 5000
    static let isMusicOn = "isMusicOn"
    static let isSoundEffectOn = "isSoundEffectOn"
    static let level = "maxLevelPlayed"
    static let gameName = "Chalk Brick"
    static let strStartGame = "Start"
    static let strPad = "KFPad"
    static let strSound = "Sound"
    static let strStarNumber = "Stars"
    static let defaultStars = 0
    static let strCurrentLevel = "currentLevel"
    static let defaultCurrentLevel = 1
    static let strCurrentPad = "currentPad"
    static let defaultPad = 0
    static let strShopInventory = "ShopInventory"
    static let strCurrentInventory = "currentInventory"
    static let defaultUserInventory = 0b1
    static let strContinueScore = "continueScore"
    static let strADMobFlag = "isADMobRemoved"
    static let defaultADMobStatus = false
    //static let ADMobAppID = "ca-app-pub-4514415662916428~2997062508"
    //static let ADMobAppID = "pub-4514415662916428"
    static let ADMobAppID = "ca-app-pub-4514415662916428~2997062508"
    static let ADMobADID = "ca-app-pub-4514415662916428/4473795704"
    
    static let InAppVerifyURL = "https://buy.itunes.apple.com/verifyReceipt"
    static let InAppSandboxURL = "https://sandbox.itunes.apple.com/verifyReceipt"
    static let InAppDiamonds = "ChalkBrick_Diamonds"
    static let InAppRemoveAds = "ChalkBrick_RemoveAds"
    static let zIndexTopMost:CGFloat = 65535
}

struct BuffValue{
    static let BigBall:CGFloat = 0.2
    static let BigBallMax:CGFloat = 1.6
    static let SmallBall:CGFloat = 0.2
    static let SmallBallMax:CGFloat = 0.64
    static let FastBall:CGFloat = 0.25
    static let FastBallMax:CGFloat = 2
    static let SlowBall:CGFloat = 0.1
    static let SlowBallMax:CGFloat = 0.8
    static let PowerBall:Int = 1
    static let PowerBallMax:Int = 5
    static let WeakBall:Int = 1
    static let WeakBallMax:Int = 1
    
    static let WidePad:CGFloat = 0.25
    static let WidePadMax:CGFloat = 2
    static let NarrowPad:CGFloat = 0.25
    static let NarrowPadMax:CGFloat = 0.5
    static let StickPad:Int = 3 // stick for 3 times
    
    static let Diamond:Int = 80
    static let Score:Int = 20
    
    
}

enum KongFu: Int{
    case Fist=0,Tiger,Crane,Snake,Monkey,Dragon,Qi,TaiChi,IAPRemoveAds,IAPDiamonds
}

struct IAPRemoveAds{
    static let Name:String = "Remove Ads"
    static let Price:String = "0.99 USD"
}

struct Fist{
    static let Name:String = "Fist"
    static let Douration:TimeInterval = 0.3
    static let zIndex:CGFloat = 110.0
    static let Range:CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 70.0 : 40.0
    static let Thickness:CGFloat = 6.0
    static let Width:CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 62.5 : 35.0
    static let Cost:CGFloat = 8.0   // avgWidth*douration 80*(2.25/2)*0.25
    static let Price:Int = 0
    static let KFType:KongFu = KongFu.Fist
}
struct Tiger{
    static let Name:String = "Tiger"
    static let Douration:TimeInterval = 0.25
    static let zIndex:CGFloat = 110.0
    static let Range:CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 70.0 : 40.0
    static let Thickness:CGFloat = 15.0
    static let Width:CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 62.5 : 35.0
    static let xScale:CGFloat = 1.5
    static let Cost:CGFloat = 8.0   // avgWidth*douration 80*(2.25/2)*0.25
    static let Price:Int = 1
    static let KFType:KongFu = KongFu.Tiger
}
struct Crane{
    static let Name:String = "Crane"
    static let Douration:TimeInterval = 0.45
    static let zIndex:CGFloat = 110.0
    static let Range:CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 52.5 : 30.0
    static let Thickness:CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 21.0 : 12.0
    static let Width:CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 70.0 : 40.0
    static let Cost:CGFloat = 8.0   // 60*0.5
    static let Price:Int = 3
    static let KFType:KongFu = KongFu.Crane
}
struct Snake{
    static let Name:String = "Snake"
    static let Douration:TimeInterval = 0.5
    static let zIndex:CGFloat = 110.0
    static let Range:CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 87.5 : 50.0
    static let Thickness:CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 45.0 : 25.0
    static let Width:CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 45.0 : 25.0
    static let Cost:CGFloat = 8.0
    static let Price:Int = 2
    static let KFType:KongFu = KongFu.Snake
}
struct Monkey{
    static let Name:String = "Monkey"
    static let Douration:TimeInterval = 0.6
    static let zIndex:CGFloat = 110.0
    static let totalLength:CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 94.0*1.75 : 94
    static let Width:CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 1.75*15.0 : 15.0
    static let Length:CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 1.75*36.0 : 36.0
    static let Thickness:CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 1.75*8.0 : 8.0
    static let Cost:CGFloat = 9.0
    static let Price:Int = 4
    static let KFType:KongFu = KongFu.Monkey
}
struct Dragon{
    static let Name:String = "Dragon"
    static let Douration:TimeInterval = 0.15 // wait for another 0.15*2
    static let zIndex:CGFloat = 110.0
    static let Width:CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 1.75*8.0 : 8.0
    static let Thickness:CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 1.75*8.0 : 8.0
    static let xScale:CGFloat = 5.75
    static let cost:CGFloat = 8.0
    static let Price:Int = 5
    static let KFType:KongFu = KongFu.Dragon
}
struct Qi{
    static let Name:String = "Qi"
    static let Douration:TimeInterval = 0.3
    static let zIndex:CGFloat = 110.0
    static let Range:CGFloat = 0.0
    static let Radius:CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 1.75*3.0 : 3.0
    static let explodeRadius:CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 1.75*18.0 : 18.0
    static let cost:CGFloat = 8.0
    static let Price:Int = 6
    static let KFType:KongFu = KongFu.Qi
}
struct TaiChi{
    static let Name:String = "TaiChi"
    static let Douration:TimeInterval = 0.45
    static let zIndex:CGFloat = 110.0
    static let Range:CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 70.0 : 40.0
    static let Angel:CGFloat = CGFloat(-Double.pi * 6)
    static let Radius:CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 1.75*12.0 : 12;
    static let cost:CGFloat = 15.0
    static let Price:Int = 10
    static let KFType:KongFu = KongFu.TaiChi
}
