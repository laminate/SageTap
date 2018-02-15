//
//  GlobalFunctions.swift
//  SageTap
//  Copyright © 2018 Sage Tap LLC. All rights reserved.
//

import UIKit

func moveToSplashScreen() {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
    appDelegate.window?.makeKeyAndVisible()
    appDelegate.window?.rootViewController = SplashViewController()
}

func moveToLoginWindow() {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
    appDelegate.window?.makeKeyAndVisible()
    appDelegate.window?.rootViewController = LoginViewController()
}

func moveToVerifyCodeWindow() {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
    appDelegate.window?.makeKeyAndVisible()
    appDelegate.window?.rootViewController = VerifyCodeViewController()
}

func moveToLoggedInWindow() {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
    appDelegate.window?.makeKeyAndVisible()
    appDelegate.window?.rootViewController = LoggedInViewController()
}

func moveToSettingsWindow() {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
    appDelegate.window?.makeKeyAndVisible()
    
    let settingsVC = SettingsViewController()
    let navController = UINavigationController(rootViewController: settingsVC)
    
    appDelegate.window?.rootViewController = navController
}
//Firebace Phone ID Verification
func moveToPhoneIDVerifyWindow() {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
    appDelegate.window?.makeKeyAndVisible()
    appDelegate.window?.rootViewController = VerifyCodeViewController()
}

//Game Card
func moveToGameCardWindow() {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
    appDelegate.window?.makeKeyAndVisible()
    appDelegate.window?.rootViewController = GameCardViewController()
}
