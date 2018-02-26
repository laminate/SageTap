//
//  LoggedInViewController / MainViewController.swift
//  SageTap
//  Copyright © 2018 Sage Tap LLC. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import SwiftyStoreKit



class LoggedInViewController: UIViewController, GIDSignInUIDelegate {
    
    @IBOutlet weak var buyLifeBtn: UIButton!
    @IBOutlet weak var userGameID: UILabel!
    var usergameid = String()
    
    @IBAction func gotogamcard(_ sender: Any) {
        moveToGameCardWindow()
    }
    
  let inAppPurchaseIDs = [
    ["com.SageTapLLC.SageTapstp.5lives"]
    ]
    
    let signOutButton = UIButton()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        SwiftyStoreKit.retrieveProductsInfo([inAppPurchaseIDs[0][0]]) { result in
            if let product = result.retrievedProducts.first {
                let priceString = product.localizedPrice!
                print("Product: \(product.localizedDescription), price: \(priceString)")
                self.buyLifeBtn.setTitle("\(product.localizedDescription) -\(priceString)", for: .normal)
            }
            else if let invalidProductId = result.invalidProductIDs.first {
                print("Invalid product identifier: \(invalidProductId)")
            }
            else {
                print("Error: \(String(describing: result.error))")
            }
        }

    }
    
    @IBAction func buyLIfeAction(_ sender: Any) {
    }
    
    
    //LOG OUT
    @IBAction func signOutBtn(_ sender: Any) {
    logOut()
    }
    
    @objc func logOut() {

        MyFirebase.shared.logOut()

    }

}
