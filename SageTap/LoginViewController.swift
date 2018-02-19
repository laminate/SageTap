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
    
    
    //Firebase Phone Authorization*********
    @IBAction func sendCode(_ sender: UIButton) {
        let alert = UIAlertController(title: "Phone Number", message: "Is this your phone number? \n \(phoneNum.text!)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes", style: .default) { (UIAlertAction) in
            PhoneAuthProvider.provider().verifyPhoneNumber(self.phoneNum.text!) { (verificationID, error) in
                if error != nil {
                print ("error: \(String(describing: error?.localizedDescription))")
                } else {
                let defaults = UserDefaults.standard
                defaults.set(verificationID, forKey: "authVID")
         //       self.performSegue(withIdentifier: "VerifyCodeViewController", sender: Any?.self)
                  //moveToVerifyCodeWindow()
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
        
        // Dispose of any resources that can be recreated.
    }
        
        //firebase phone verify
    
    
            //firebase phone verify

    @objc func signInAnon() {
        MyFirebase.shared.signInAnonymous()
    
        
    }
    
    /**
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue.identifier == "Segue identifier set in storyboard") {
            // Put your code here or call onLogoutClick(null)
        }
    }
    **/
}

