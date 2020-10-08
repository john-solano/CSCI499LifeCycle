//
//  RegisterViewController.swift
//  LifeCycle
//
//  Created by John Solano on 9/24/20.
//  Copyright © 2020 John Solano. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var fname : UITextField!
    @IBOutlet weak var lname : UITextField!
    @IBOutlet weak var email : UITextField!
    @IBOutlet weak var password : UITextField!
    @IBOutlet weak var repassword : UITextField!
    @IBOutlet weak var errorLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        errorLabel.alpha = 0;
        
    }
    
    @IBAction func SignUpTapped(_ sender: Any) {
        // Clean fields from text box
        let Fname = fname.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let Lname = lname.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let Email = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let Password = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let Repassword = repassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Reference to Story Board
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
        
        //Register User
        Auth.auth().createUser(withEmail: Email, password: Password) { authResult, error in
            if let error = error {
                //Show error
                self.showError("\(error.localizedDescription)")
            }
            else {
                // fetch UUID that was just created
                guard let userID = Auth.auth().currentUser?.uid else { return }
                
                // add fname, lname to db
                let db = Firestore.firestore()
                
                db.collection("users").document(userID).setData([
                    "Fname": Fname,
                    "Lname": Lname,
                ]) { err in
                    if let err = err {
                        print("Error writing document: \(err)")
                    } else {
                        print("Document successfully written!")
                    }
                }
                // Go to home page
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
            }
        }
    }
    
    func showError(_ message:String){
     errorLabel.text = message
     errorLabel.alpha = 1
    }
    
    
 
    
}
