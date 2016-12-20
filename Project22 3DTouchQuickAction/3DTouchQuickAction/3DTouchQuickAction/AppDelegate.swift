//
//  AppDelegate.swift
//  3DTouchQuickAction
//
//  Created by ChenZuo on 2016/12/15.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var launchedShortcutItem: UIApplicationShortcutItem?
    
    
    enum ShortcutIdentifier:String {
        case First
        case Second
        case Third
        
        init?(fullType: String) {
            guard let last = fullType.components(separatedBy: ".").last else {
                return nil
            }
            self.init(rawValue: last)
        }
        var type : String {
            return Bundle.main.bundleIdentifier! + ".\(self.rawValue)"
        }
        
    }
    
    func handleShortCutItem(_ shortcutItem: UIApplicationShortcutItem) -> Bool {
        var handled = false
        guard ShortcutIdentifier(fullType: shortcutItem.type) != nil else{
            return false
        }
        guard let shortCutType = shortcutItem.type as String? else {
            return false
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var vc = UIViewController()
        
        switch (shortCutType) {
        case ShortcutIdentifier.First.type:
            // Handle shortcut 1
            vc = storyboard.instantiateViewController(withIdentifier: "RunVC") as! RunViewController
            handled = true
            break
        case ShortcutIdentifier.Second.type:
            // Handle shortcut 2
            vc = storyboard.instantiateViewController(withIdentifier: "ScanVC") as! ScanViewController
            handled = true
            break
        case ShortcutIdentifier.Third.type:
            // Handle shortcut 3
            vc = storyboard.instantiateViewController(withIdentifier: "WiFiVC") as! SwitchViewController
            handled = true
            break
        default:
            break
        }
        
        // Display the selected view controller
        window!.rootViewController?.present(vc, animated: true, completion: nil)
        return handled
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        let handledShortCutItem = handleShortCutItem(shortcutItem)
        completionHandler(handledShortCutItem)
    }
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        if let shortcutItem = launchOptions?[UIApplicationLaunchOptionsKey.shortcutItem] as? UIApplicationShortcutItem{
            launchedShortcutItem = shortcutItem
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }


}

