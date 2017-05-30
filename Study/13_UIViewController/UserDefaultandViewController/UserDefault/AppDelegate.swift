//
//  AppDelegate.swift
//  UserDefault
//
//  Created by joe on 2017. 5. 30..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController: MainViewController = storyboard.instantiateViewController(withIdentifier: "MainView") as! MainViewController
        
        self.window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()
        
        
//       ///////////////////////////////////////////////
//        //뷰컨트롤러를 코드로 불러와준다
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//        
//        
//        //스토리보드를 만들어 연결시켜준다
//        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController:ViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        //withIdentifier 에 들어가는 이름은 연결된 스토리보드의 ID와 같아야한다
//        //
//        
//        self.window?.rootViewController = viewController
//        self.window?.makeKeyAndVisible()
//        ///////////////////////////////////////////////
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

