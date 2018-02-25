//
//  Helper.swift
//  SageTap
//
//  Created by Greenleaf Media on 2/24/18.
//  Copyright © 2018 Sage Tap LLC. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func displayError(msg: String) {
        let alert = UIAlertController(title: "SageTap Error", message: msg, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
}
