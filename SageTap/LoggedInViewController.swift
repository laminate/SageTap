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
    
    
    @IBAction func PlayBtnClick(_ sender: Any) {
        performSegue(withIdentifier: "PlayGameSegue", sender: self)
    }
    
    @IBAction func SignOutClick(_ sender: Any) {
        MyFirebase.shared.logOut()
        performSegue(withIdentifier: "SignOutSegue", sender: self)
    }
    
    let logOutBtn = UIButton(frame: CGRect(x: 10, y: 35, width: 200, height: 30))
    let signOutButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Sage Tap"
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .black

        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        navigationItem.titleView = titleLabel
        titleLabel.text = "Sage Tap"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .orange
        
        //   Need to remove this button and replace with navigator
        
       logOutBtn.setTitle("Sign Out", for: .normal)
       logOutBtn.setTitleColor(.black, for: .normal)
       logOutBtn.adjustsImageWhenHighlighted = true
        
        view.addSubview(logOutBtn)
    }
    
   
}


