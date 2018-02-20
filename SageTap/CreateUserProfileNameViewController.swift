//
//  CreateUserProfileNameViewController.swift
//  SageTap
//
//  Created by Kirk Honour on 2/15/18.
//  Copyright © 2018 Sage Tap LLC. All rights reserved.
//

import UIKit

class CreateUserProfileNameViewController: UIViewController {
    
    
    
 
    @IBOutlet weak var userGameID: UITextField!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  
    @IBAction func userIDBtn(_ sender: Any) {
            if userGameID.text != ""
            {
                moveToLoggedInWindow()
        }
        
    }
   

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }

}
