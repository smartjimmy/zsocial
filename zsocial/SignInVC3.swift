//
//  ViewController.swift
//  zsocial
//
//  Created by James Kang on 1/20/17.
//  Copyright © 2017 James Kang. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Function that runs after the fb button is tapped
    @IBAction func facebookButtonTapped3(_ sender: Any) {
        
        let facebookLogin3 = FBSDKLoginManager()
        
        facebookLogin3.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("JIMMY: Unable to auth with Facebook")
            } else if result?.isCancelled == true {
                print("JIMMY: User cancelled facebook auth")
            } else {
                print("JIMMY: Sucessfully authentificated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth3(credential)
                
            }
        }
    }
    
    func firebaseAuth3(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("Unable to auth with Firebase")
            } else {
                print("JIMMY: Successfully authentificated with Firebase")
            }
        })
    }

}

