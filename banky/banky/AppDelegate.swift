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
    
  //  var hasOnboarded = false
    
    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
    let dummyViewController = DummyViewController()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        //Û  window?.backgroundColor = .orange
        window?.rootViewController = loginViewController
        loginViewController.delegate = self
        dummyViewController.logoutDlegate = self
        // window?.rootViewController = onboardingContainerViewController
        onboardingContainerViewController.delegate = self
        //window?.rootViewController = OnboardingViewController(heroImageName: "delorean", titleText: "das wird der Text")
        return true
    }
    
}

extension AppDelegate: LoginViewControllerDelegate {
    //  func didLogin() {
    //    print("im delegate")
    // window?.rootViewController = onboardingContainerViewController
    //setRootViewController(onboardingContainerViewController)
    
    func didLogin() {
        if LocalState.hasOnboarded {
            setRootViewController(dummyViewController)
        } else {
            setRootViewController(onboardingContainerViewController)
        }
    }
    
    
}
//  OnboardingViewControllerDelegate
extension AppDelegate: OnboardingViewControllerDelegate {
    func didFinishOnboarding() {
        print("im Onboarding delegate")
        LocalState.hasOnboarded = true
        setRootViewController(dummyViewController)
        }
}

extension AppDelegate: LogoutDelegate {
    func didLogout() {
        
        setRootViewController(loginViewController)
    }
    
    
}


extension AppDelegate {
    // für einen weichen Übergang
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.9,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}
