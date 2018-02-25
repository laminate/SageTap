//
//  ViewController.swift
//  SageTap
//  Copyright © 2018 Sage Tap LLC. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController{ //},FUIAuthDelegate {
   

    var currentUser: User?
    var userId: String = ""
    
    
    @IBOutlet weak var phoneNum: UITextField!
    @IBAction func justWatchButton(_ sender: Any) {
        self.signInAnon()
        performSegue(withIdentifier: "AnonymousLogin", sender: self)
    }
    
    
    @IBAction func sendCode(_ sender: Any) {

        let alert = UIAlertController(title: "Phone Number", message: "Is this your phone number? \n \(phoneNum.text!)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes", style: .default) { (UIAlertAction) in
            
            PhoneAuthProvider.provider().verifyPhoneNumber(self.phoneNum.text!, uiDelegate: nil) { (verificationID, error) in
                if let error = error {
                    self.displayError(msg: "Oops! " + error.localizedDescription)
                    return
                } else {
                let defaults = UserDefaults.standard
                defaults.set(verificationID, forKey: "authVID")
                    self.performSegue(withIdentifier: "VerifyCodeSeque", sender: self)
                }
            }
 
        }
        
        let cancel = UIAlertAction(title: "No", style: .default)
        alert.addAction(action)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)

        
    }
    
    //Firebase Phone Authorization*******
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @objc func signInAnon() {
        MyFirebase.shared.signInAnonymous()
    }
    
}

