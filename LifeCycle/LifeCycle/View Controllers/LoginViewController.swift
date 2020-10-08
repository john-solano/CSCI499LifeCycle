//
//  LoginViewController.swift
//  LifeCycle
//
//  Created by John Solano on 9/22/20.
//  Copyright © 2020 John Solano. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    
    @IBOutlet weak var username : UITextField!
    
    @IBOutlet weak var password : UITextField!
    
    @IBOutlet weak var errorLabel : UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        errorLabel.alpha = 0;
    }
    

    @IBAction func LoginTapped(_ sender: Any) {
        print("Login Tapped");
        
        // Create clean fields/parse text from text box
        let email = username.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let pass = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Reference to Story Board
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
        
        //Sign in the user
        Auth.auth().signIn(withEmail: email, password: pass) { (result, error) in
            if let error = error {
                self.showError("\(error.localizedDescription)")
            }
            else{
                // This is to get the SceneDelegate object from your view controller
                // then call the change root view controller function to change to main tab bar
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
            }
        } // end of sign in
        
    }

    
    func showError(_ message:String){
     errorLabel.text = message
     errorLabel.alpha = 1
    }

}
