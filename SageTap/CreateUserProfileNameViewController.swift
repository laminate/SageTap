//
//  CreateUserProfileNameViewController.swift
//  SageTap
//
//  Created by Kirk Honour on 2/15/18.
//  Copyright © 2018 Sage Tap LLC. All rights reserved.
//

import UIKit

class CreateUserProfileNameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
//NEED TO ADD a USER GAME ID that will reside in profile db
        
        //wait time set to +X seconds ***
        DispatchQueue.main.asyncAfter(deadline: .now() + 4){
        
            moveToLoggedInWindow() }
          //wait time set to +X seconds ***

    }

}
