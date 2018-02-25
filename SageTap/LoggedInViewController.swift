//
//  MainViewController.swift
//  SageTap
//  Copyright © 2018 Sage Tap LLC. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoggedInViewController: UIViewController,
GIDSignInUIDelegate {
    
    @IBAction func SignOutClick(_ sender: Any) {
        MyFirebase.shared.logOut()
        performSegue(withIdentifier: "SignOutSegue", sender: self)
    }
    
}


