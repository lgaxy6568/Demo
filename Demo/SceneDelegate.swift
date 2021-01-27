//
//  SceneDelegate.swift
//  Demo
//
//  Created by 李果 on 2021/1/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        //使用此方法可以选择性地配置UIWindow“window”并将其附加到提供的UIWindowScene“scene”。
        //如果使用情节提要，“window”属性将自动初始化并附加到场景。
        //此委托并不意味着连接的场景或会话是新的（请参见`ap应用程序：用于连接场景会话的配置`相反）。
        LogUtils.LogD("scene_(),初始化~,当前线程是否为主线程=\(ThreadUtils.isMainThread())")
        guard let winScene = (scene as? UIWindowScene) else { return }
        let win = UIWindow(windowScene: winScene)
        win.rootViewController = UINavigationController.init(rootViewController:HomeViewController())
        win.makeKeyAndVisible()
        self.window = win
        LogUtils.LogD("scene_(),初始化成功~")
        //开始加载开屏广告~
        startLoadAd()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
        //称为场景正在被系统释放。
        //这发生在场景进入背景后不久，或者在其会话被丢弃时。
        //释放与此场景关联的所有资源，这些资源可以在下次场景连接时重新创建。
        //场景稍后可能会重新连接，因为它的会话不一定会被丢弃（见 application:didDiscardSceneSessions 相反）。
        LogUtils.LogD("sceneDidDisconnect(),即将被销毁~")
        
    }
       
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        //当场景从非活动状态移动到活动状态时调用。
        //使用此方法可重新启动场景处于非活动状态时暂停（或尚未启动）的所有任务。
        LogUtils.LogD("sceneDidBecomeActive(),已经被激活~")
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        //当场景从活动状态移动到非活动状态时调用。
        //这可能是由于临时中断（例如来电）造成的。
        LogUtils.LogD("sceneWillResignActive(),即将被挂起~")
    }
   

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        //当场景从背景过渡到前景时调用。
        //使用此方法可以撤消在进入背景时所做的更改。
        LogUtils.LogD("sceneWillEnterForeground(),即将进入前台~")
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        //当场景从前景过渡到背景时调用。
        //使用此方法可以保存数据、释放共享资源并存储足够的场景特定状态信息
        //将场景恢复到当前状态。
        LogUtils.LogD("sceneDidEnterBackground(),已进入后台~")
    }

    
    //==============================广告Begin=============================
    var adTimer:DispatchSourceTimer? = nil
    var adCountDownTime = 5
    var adView:UIView? = nil
    private func startAdCountDownTimer() {
        adTimer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
        adTimer?.schedule(deadline: .now(),repeating: .seconds(1))
        adTimer?.setEventHandler(handler: {
            DispatchQueue.main.async { [weak self] in
                self?.updateSkipView()
            }
        })
        if(!adTimer!.isCancelled){
            adTimer?.resume()
        }
    }
    
    private func updateSkipView(){
        LogUtils.LogD("updateSkipView(),\(adCountDownTime)")
        if(self.adCountDownTime <= 0){
            adTimer?.cancel()
            removeAdView()
        }else{
            //self.skipView?.text = "\(limitTime)秒"
            self.adCountDownTime -= 1
        }
    }
    
    private func removeAdView(){
        if(adView != nil){
            LogUtils.LogD("removeAdView(),【广告已移除~】")
            adView?.removeFromSuperview()
        }
    }
    
    private func startLoadAd(){
        adView = Bundle.main.loadNibNamed("SplashAdView", owner: self, options: nil)?[0] as? UIView
        if(adView != nil){
            self.window?.addSubview(adView!)
            LogUtils.LogD("startLoadAd(),【广告已添加~】")
            startAdCountDownTimer()
        }else{
            LogUtils.LogD("startLoadAd(),adView is null")
        }
    }
    //==============================广告End=============================
}

