//
//  MyFirebase.swift
//  SageTap
//  Copyright © 2018 Sage Tap LLC. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase

class MyFirebase {
    
    static let shared = MyFirebase()
    
    var currentUser: User?
    var userId: String = ""
    var dbRef: DatabaseReference! = Database.database().reference()
    
    private var listenHandler: AuthStateDidChangeListenerHandle?
    
    private init() {
        
    }
    
    
    
    func addUserListener(loggedIn: Bool) {
        print ("Add listener")
        listenHandler = Auth.auth().addStateDidChangeListener { (auth, user) in
            if user == nil {
                // We are Logged Out
                print("Logged Out")
                self.currentUser = nil
                self.userId = ""
                  //wait time set to +X seconds below
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                
                    if loggedIn {
                        moveToLoggedInWindow()
                    } else {
                        moveToLoginWindow()
                    }
                }
            }
            else {
                print ("Logged In")
                
                if (self.currentUser == nil) {
                    self.currentUser = user
                    self.userId = (user?.uid)!
                    print(self.userId)
                    
                    // LOAD ANY DATA HERE
                     //wait time set to +X seconds below
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        moveToLoggedInWindow()
                    }
                }
            }
        }
    }
    
    func removeUserListener() {
        guard listenHandler != nil else {
            return
        }
        Auth.auth().removeStateDidChangeListener(listenHandler!)
    }
    
    func signInAnonymous() {
        Auth.auth().signInAnonymously() { (user, error) in
            print("\(String(describing: error))")
            print("\(String(describing: user))")
        }
    }
    
    func isLoggedIn() -> Bool {
        return(currentUser != nil)
    }
    
    func linkCredential(credential: AuthCredential) {
        
        currentUser?.link(with: credential) {
            (user, error) in
            
            if let error = error {
                print (error)
                return
            }
            
            print ("credential linked")
        }
    }
    
    
    
    func logOut() {
        try! Auth.auth().signOut()
  
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
