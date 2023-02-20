//
//  AppDelegate.swift
//  banky
//
//  Created by Johann Csida on 14.02.23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        //Û  window?.backgroundColor = .orange
        window?.rootViewController = LoginViewController()
        
        return true
    }
    
    
}

