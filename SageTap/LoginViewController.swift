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
    
    
  let anonLoginBtn = UIButton()
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    
        
        anonLoginBtn.setTitle("Just Watch", for: .normal)
        anonLoginBtn.adjustsImageWhenHighlighted = true
        anonLoginBtn.setTitleColor(UIColor.white, for: .normal)
        anonLoginBtn.backgroundColor = UIColor.black
        anonLoginBtn.frame = CGRect(x: view.frame.width/2 - 150, y: view.frame.height/2 + 36, width: 300, height: 36)
        view.addSubview(anonLoginBtn)
        anonLoginBtn.addTarget(self, action: #selector(signInAnon), for: .touchUpInside)
       
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
                  moveToVerifyCodeWindow()
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
}

