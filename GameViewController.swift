//
//  GameViewController.swift
//  GuestureBrick
//
//  Created by jim on 16/12/21.
//  Copyright © 2016年 Jim. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import GoogleMobileAds
import AudioToolbox
import AVFoundation

class GameViewController: UIViewController, GADBannerViewDelegate {
    
    //var productDict:NSMutableDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        #if DEBUG
            let appDomain = Bundle.main.bundleIdentifier!
            UserDefaults.standard.removePersistentDomain(forName: appDomain)
            
            setStarsToHistory(star: 12)
            setLevelToHistory(lv: 11)
        #endif
        
        //SKPaymentQueue.default().add(self)
        //requestProducts()
        
        if let view = self.view as! SKView? {
            let menuScene = MenuScene()
            //menuScene.size = CGSize(width: self.view.frame.size.width*2, height: view.frame.size.height*2)
            menuScene.size = view.frame.size
            menuScene.scaleMode = .aspectFill
            view.presentScene(menuScene)
            
            view.ignoresSiblingOrder = true
            //view.showsFPS = true
            //view.showsNodeCount = true
            //view.showsPhysics = true
        }
    }

    deinit{
        //SKPaymentQueue.default().remove(self)
    }
    
   
    
    override var shouldAutorotate: Bool {
        return false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}




/************ NOT USED 
 
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
 }
 
 
 
 
 
 
 
 /*
 // 点击购买产品后触发的
 func onSelectRechargePackages(productId: String){
 //先判断是否支持内购
 if(SKPaymentQueue.canMakePayments()){
 buyProduct(product: productDict[productId] as! SKProduct)
 }
 else{
 print("============不支持内购功能")
 }
 
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
 print("支付成了＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝")
 
 if transaction.transactionIdentifier == ConfigKeys.InAppRemoveAds {
 setAdMobStatusToHistory(isRemoved: true)
 }else{
 if transaction.transactionIdentifier == ConfigKeys.InAppDiamonds {
 let nowStr = getStarsFromHistory()
 setStarsToHistory(star: nowStr + 12)
 }
 }
 
 
 // 验证购买凭据
 self.verifyPruchase()
 
 // 将交易从交易队列中删除
 SKPaymentQueue.default().finishTransaction(transaction )
 
 
 }
 else if(SKPaymentTransactionState.failed == transaction.transactionState){
 print("支付失败＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝")
 SKPaymentQueue.default().finishTransaction(transaction )
 }
 else if (SKPaymentTransactionState.restored == transaction.transactionState) {//恢复购买
 // 更新界面或者数据，把用户购买得商品交给用户
 // ...
 
 // 将交易从交易队列中删除
 SKPaymentQueue.default().finishTransaction(transaction )
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
 print("payload:\(payload)")
 let payloadData = payload.data(using: String.Encoding.utf8.rawValue)
 //let payloadData = payload.dataUsingEncoding(NSUTF8StringEncoding)
 
 request.httpBody = payloadData;
 
 // 提交验证请求，并获得官方的验证JSON结果
 let sess = URLSession.shared
 let dataTask = sess.dataTask(with: request as URLRequest) { (data, respond, error) in
 guard let data = data else { return }
 if let result = try? JSONSerialization.jsonObject(with: data, options: .allowFragments){
 print(result)
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
 */
 */
