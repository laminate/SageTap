//
//  VerifyCodeViewController.swift
//  phoneAuth2
//
//  Copyright © 2018 Sage Tap LLC. All rights reserved.
//

import UIKit
import FirebaseAuth
import UserNotifications

class VerifyCodeViewController: UIViewController {

    
   
    @IBOutlet weak var verifyCode: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   
    @IBAction func verifyCodeBtn(_ sender: Any) {
        let defaults = UserDefaults.standard
        let credential: PhoneAuthCredential = PhoneAuthProvider.provider().credential(withVerificationID: defaults.string(forKey: "authVID")!, verificationCode: verifyCode.text!)
        Auth.auth().signIn(with: credential) {(user, error) in
            if error != nil{
                print("error: \(String(describing: error?.localizedDescription))")
               } else {
                print("Phone number: \(String(describing: user?.phoneNumber))")
                let userInfo = user?.providerData[0]
                print("Provider ID: \(String(describing: userInfo?.providerID))")
                //self.performSegue(withIdentifier: "LoggedInViewController", sender: Any?.self)
                moveToCreateUserProfileNameWindow()
        }
      }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
