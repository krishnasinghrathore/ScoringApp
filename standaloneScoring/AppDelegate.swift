//
//  AppDelegate.swift
//  standaloneScoring
//
//  Created by Nick Harder on 1/23/20.
//  Copyright © 2020 Nick Harder. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
       let storyBoard = UIStoryboard(name: "Auth", bundle:Bundle.main)
        
       self.window = UIWindow(frame: UIScreen.main.bounds)
        let loginVc = (storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController ?? nil)!
        let navigationController = UINavigationController.init(rootViewController: loginVc)
       if let window = window {
        window.rootViewController = navigationController
         }
       self.window?.makeKeyAndVisible()
           return true
    }
    
    var orientationLock = UIInterfaceOrientationMask.all

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return self.orientationLock
    }
    struct AppUtility {
        static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
            if let delegate = UIApplication.shared.delegate as? AppDelegate {
                delegate.orientationLock = orientation
            }
        }

        static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {
            self.lockOrientation(orientation)
            UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
        }
    }
}

