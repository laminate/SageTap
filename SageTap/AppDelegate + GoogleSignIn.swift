//
//  AppDelegate + GoogleSignIn.swift
//  SageTap
//  Copyright © 2018 Sage Tap LLC. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

var currentUser: User?

extension AppDelegate: GIDSignInDelegate {

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        // ...
        if let error = error {
            print(error)
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        //Pass Google credential to MyFirebase
       
        guard let user = MyFirebase.shared.currentUser else {
            
            Auth.auth().signIn(with: credential) { (user, error) in
                if let error = error {
                    print (error)
                    return
                }
            }
            return
        }

        
        if (user.isAnonymous){
            MyFirebase.shared.linkCredential(credential: credential)
        }
    }

    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        
        // Perform any operations when the user disconnects from app here.
        // ...
        
    }
    func firebaseLogOut() {
        if currentUser != nil {
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
        }
    }
}
