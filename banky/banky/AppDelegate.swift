//
//  AppDelegate.swift
//  banky
//
//  Created by Johann Csida on 14.02.23.
//

import UIKit

let appColor: UIColor = .systemTeal
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let loginViewController = LoginViewController()
    let onboardingViewController = OnboardingContainerViewController()
    let mainViewController = MainViewController()
        
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
                
        loginViewController.delegate = self
        onboardingViewController.delegate = self

        displayLogin()
        return true
    }

    private func displayLogin() {
        setRootViewController(loginViewController)
    }

    private func displayNextScreen() {
        if LocalState.hasOnboarded {
            prepMainView()
            setRootViewController(mainViewController)
        } else {
            setRootViewController(onboardingViewController)
        }
    }
    
    private func prepMainView() {
        mainViewController.setStatusBar()
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().backgroundColor = appColor
    }
}

extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }

        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        displayNextScreen()
    }
}

extension AppDelegate: OnboardingViewControllerDelegate {
    func didFinishOnboarding() {
        LocalState.hasOnboarded = true
        prepMainView()
        setRootViewController(mainViewController)
    }
}

extension AppDelegate: LogoutDelegate {
    func didLogout() {
        setRootViewController(loginViewController)
    }
}

/*
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let mainViewController = MainViewController()
  //  var hasOnboarded = false
    
    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
   // let dummyViewController = DummyViewController()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        //Û  window?.backgroundColor = .orange
     //   window?.rootViewController = loginViewController
      //  window?.rootViewController = mainViewController
        window?.rootViewController = AccountSummaryViewController()

        loginViewController.delegate = self
        //dummyViewController.logoutDlegate = self
        // window?.rootViewController = onboardingContainerViewController
        onboardingContainerViewController.delegate = self
        //onboardingViewController.delegate = self
        
        //window?.rootViewController = OnboardingViewController(heroImageName: "delorean", titleText: "das wird der Text")
        //mainViewController.selectedIndex = 1
        
     let vc = mainViewController
     vc.setStatusBar()

     UINavigationBar.appearance().isTranslucent = false
     UINavigationBar.appearance().backgroundColor = appColor
         
     window?.rootViewController = vc
         
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
            setRootViewController(mainViewController)
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
        setRootViewController(mainViewController)
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

*/
