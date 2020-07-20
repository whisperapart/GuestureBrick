//
//  shopScene.swift
//  GuestureBrick
//
//  Created by jim on 2017/5/2.
//  Copyright © 2017年 Jim. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit
import StoreKit

class ShopScene: SKScene, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    internal var guiLenMax:CGFloat = 0.0
    internal var guiHeiMax:CGFloat = 0.0
    internal var guiCell:CGFloat = 0.0
    weak var scrollView: SwiftySKScrollView?
    internal var actFirstPoint = CGPoint.zero
    internal var productDict:NSMutableDictionary!
    
    internal var sndNameArr = [String]()
    
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
        if getSoundSetting() {
            self.sndLoadSingle(nodeName: "bgSound", fileName: "bg3.m4a", isBG: true)
            self.sndLoadSingle(nodeName: "efSoundYes", fileName: "yes.wav", isBG: false)
            self.sndLoadSingle(nodeName: "efSoundNo", fileName: "no.caf", isBG: false)
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
    internal func removeAllChildrenBut(names:[String]){
        for c in self.children{
            guard let n = c.name else {
                c.removeFromParent()
                continue
            }
            if(!names.contains(n)){
                c.removeFromParent()
            }
        }
    }
    deinit{
        self.scrollView?.removeFromSuperview()
        SKPaymentQueue.default().remove(self)
        //self.removeAllActions()
        //self.removeAllChildren()
        //self.removeFromParent()
        //print("shop deinit")
    }
    
    
    
    // 点击购买产品后触发的
    /*
    func onSelectRechargePackages(productId: String){
        //先判断是否支持内购
        if(SKPaymentQueue.canMakePayments()){
            buyProduct(product: productDict[productId] as! SKProduct)
        }
        else{
            print("============不支持内购功能")
        }
        
    }
     */
    
    
    //询问苹果的服务器能够销售哪些商品
    func requestProducts(){
        
        //let set = NSSet(array: ["ChalkBrick_RemoveAds","ChalkBrick_Diamonds"])
        //let request = SKProductsRequest(productIdentifiers: set as! Set<String>)
        var set = Set<String>()
        set.insert(ConfigKeys.InAppRemoveAds)
        set.insert(ConfigKeys.InAppDiamonds)
        let request = SKProductsRequest(productIdentifiers: set)
        request.delegate = self;
        request.start()
    }
    
    // 以上查询的回调函数
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        
        /*
         print("request call back:\(response.products.count)")
         print("available:\(response.invalidProductIdentifiers.joined(separator: "|"))")
         */
        
        if (productDict == nil) {
            productDict = NSMutableDictionary(capacity: response.products.count)
        }
        
        for product in response.products {
            /* 激活了对应的销售操作按钮，相当于商店的商品上架允许销售
             print("=======Product id=======\(product.productIdentifier)")
             print("===产品标题 ==========\(product.localizedTitle)")
             print("====产品描述信息==========\(product.localizedDescription)")
             print("=====价格: =========\(product.priceLocale.currencyCode!) \(product.price)")
             */
            // 填充商品字典
            productDict.setObject(product, forKey: product.productIdentifier as NSCopying)
            
            
        }
        //print("===== get product =====")
        self.guiUpdateInAppAds()
        self.guiUpdateInAppDiamonds()
    }
    
    
    
    
    // 购买对应的产品
    func buyProduct(product: SKProduct){
        let payment = SKPayment(product: product)
        SKPaymentQueue.default().add(payment)
    }
    
    func paymentQueue(_ queue:SKPaymentQueue,updatedTransactions transctions:[SKPaymentTransaction]){
        // 调试
        for transaction in transctions {
            // 如果小票状态是购买完成
            if (SKPaymentTransactionState.purchased == transaction.transactionState) {
                // 更新界面或者数据，把用户购买得商品交给用户
                //print("支付成了＝＝＝＝＝＝＝＝＝＝\(transaction.payment.productIdentifier)")
                self.guiRemoveMask()
                
                if transaction.payment.productIdentifier == ConfigKeys.InAppRemoveAds {
                    setAdMobStatusToHistory(isRemoved: true)
                    self.removeAllChildrenBut(names: self.sndNameArr)
                    self.scrollView?.removeFromSuperview()
                    self.guiDrawMenu(mcell: self.guiCell*1.25)
                    self.guiDrawInventory()
                    self.guiUpdateInAppAds()
                    self.guiUpdateInAppDiamonds()
                }else{
                    if transaction.payment.productIdentifier == ConfigKeys.InAppDiamonds {
                        //print("confirm:diamonds")
                        let nowStr = getStarsFromHistory()
                        //print("currentStar:\(nowStr)")
                        setStarsToHistory(star: nowStr + 12)
                        self.removeAllChildrenBut(names: self.sndNameArr)
                        self.scrollView?.removeFromSuperview()
                        self.guiDrawMenu(mcell: self.guiCell*1.25)
                        self.guiDrawInventory()
                        self.guiUpdateInAppAds()
                        self.guiUpdateInAppDiamonds()
                    }
                }
                
                
                // 验证购买凭据
                //self.verifyPruchase()
                // 使用单机模式，不进行二次验证
                
                // 将交易从交易队列中删除
                SKPaymentQueue.default().finishTransaction(transaction )
                
                
            }
            else if(SKPaymentTransactionState.failed == transaction.transactionState){
                //print("支付失败＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝")
                SKPaymentQueue.default().finishTransaction(transaction )
                self.guiRemoveMask()
            }
            else if (SKPaymentTransactionState.restored == transaction.transactionState) {//恢复购买
                // 更新界面或者数据，把用户购买得商品交给用户
                // ...
                if transaction.transactionIdentifier == ConfigKeys.InAppRemoveAds {
                    setAdMobStatusToHistory(isRemoved: true)
                    self.removeAllChildrenBut(names: self.sndNameArr)
                    self.scrollView?.removeFromSuperview()
                    self.guiDrawMenu(mcell: self.guiCell*1.25)
                    self.guiDrawInventory()
                }else{
                    if transaction.transactionIdentifier == ConfigKeys.InAppDiamonds {
                        let nowStr = getStarsFromHistory()
                        setStarsToHistory(star: nowStr + 12)
                        self.removeAllChildrenBut(names: self.sndNameArr)
                        self.scrollView?.removeFromSuperview()
                        self.guiDrawMenu(mcell: self.guiCell*1.25)
                        self.guiDrawInventory()
                    }
                }
                // 将交易从交易队列中删除
                SKPaymentQueue.default().finishTransaction(transaction )
                self.guiRemoveMask()
            }
            
        }
    }
    
    func verifyPruchase(){
        // 验证凭据，获取到苹果返回的交易凭据
        // appStoreReceiptURL iOS7.0增加的，购买交易完成后，会将凭据存放在该地址
        let receiptURL = Bundle.main.appStoreReceiptURL
        // 从沙盒中获取到购买凭据
        let receiptData = NSData(contentsOf: receiptURL!)
        // 发送网络POST请求，对购买凭据进行验证
        let url = URL(string: ConfigKeys.InAppSandboxURL)!
        // 国内访问苹果服务器比较慢，timeoutInterval需要长一点
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        //let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "POST"
        // 在网络中传输数据，大多情况下是传输的字符串而不是二进制数据
        // 传输的是BASE64编码的字符串
        let encodeStr = receiptData?.base64EncodedString(options: .endLineWithCarriageReturn)
        //let encodeStr = receiptData?.base64EncodedStringWithOptions(NSData.Base64EncodingOptions.EncodingEndLineWithLineFeed)
        
        let payload = NSString(string: "{\"receipt-data\" : \"" + encodeStr! + "\"}")
        //print("payload:\(payload)")
        let payloadData = payload.data(using: String.Encoding.utf8.rawValue)
        //let payloadData = payload.dataUsingEncoding(NSUTF8StringEncoding)
        
        request.httpBody = payloadData;
        
        // 提交验证请求，并获得官方的验证JSON结果
        let sess = URLSession.shared
        let dataTask = sess.dataTask(with: request as URLRequest) { (data, respond, error) in
            guard let data = data else { return }
            if let result = try? JSONSerialization.jsonObject(with: data, options: .allowFragments){
                //print(result)
            }
        }
        dataTask.resume()
        
        /*
         // 官方验证结果为空
         if (result == nil) {
         //验证失败
         print("验证失败")
         return
         }
         var dict: AnyObject? = JSONSerialization.JSONObjectWithData(result!, options: NSJSONReadingOptions.AllowFragments, error: nil)
         if (dict != nil) {
         // 比对字典中以下信息基本上可以保证数据安全
         // bundle_id&application_version&product_id&transaction_id
         // 验证成功
         print(dict)
         }
         */
    }
    func restorePurchase(){
        SKPaymentQueue.default().restoreCompletedTransactions()
    }

    
}
