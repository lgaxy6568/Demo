/**
//  AppDelegate.swift
//  Demo
//
//  Created by 李果 on 2021/1/25.
//
 iOS13之后，appDelegate的职责是处理App生命周期和新的SceneSession生命周期。
 所有UI生命周期交给SceneDelegate处理，appDelegate不在负责UI生命周期。
*/

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // 应用程序启动后自定义的覆盖点
        LogUtils.LogD("application()_1")
        
        return true
    }

    // MARK: UI场景会话生命周期

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        LogUtils.LogD("application()_2,创建了一个新的场景")
        // 在创建新的场景会话时调用。
        // 使用此方法可以选择要创建新场景的配置
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        LogUtils.LogD("application()_3")
        // 当用户放弃场景会话时调用。
        // 如果在应用程序未运行时丢弃了任何会话，则将在ap后不久调用该会话复制：使用选项完成启动。
        // 使用此方法释放特定于丢弃场景的任何资源，因为它们不会再被使用。
    }


}

