//
//  MainViewController.swift
//  SageTap
//  Copyright © 2018 Sage Tap LLC. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoggedInViewController: UIViewController, GIDSignInUIDelegate {
    
    @IBOutlet weak var userGameID: UILabel!
    var usergameid = String()
    
    @IBAction func gotogamcard(_ sender: Any) {
        moveToGameCardWindow()
    }
    
  
    let signOutButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
         userGameID.text = usergameid
        
        navigationItem.title = "Sage Tap"
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .black

    let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        navigationItem.titleView = titleLabel
        titleLabel.text = "Sage Tap"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .orange
        

    }
    
    @IBAction func signOutBtn(_ sender: Any) {
    logOut()
    }
    @objc func logOut() {

        MyFirebase.shared.logOut()

    }
}


