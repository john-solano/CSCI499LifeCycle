//
//  SettingsViewController.swift
//  LifeCycle
//
//  Created by John Solano on 10/8/20.
//  Copyright © 2020 John Solano. All rights reserved.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {
    var EM : String = ""
    
    @IBOutlet weak var test: UITextField!
    
    @IBOutlet weak var EMlbl: UIButton!
    
    @IBOutlet weak var settings: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user = Auth.auth().currentUser
        if let user = user {
            EM = user.email!
        }
        
        EMlbl.setTitle("\(EM)", for: .normal)
       // settings.setPadding()
        //settings.setBottomBorder()
    }
  
<<<<<<< HEAD:LifeCycle/LifeCycle/TabBar View Controllers/SettingsViewController.swift
    @IBAction func UserEmailTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let ProfileViewController = storyboard.instantiateViewController(identifier: "ProfileViewController")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(ProfileViewController)
        
    }

=======
    
    @IBAction func NotificationTapped(_ sender: Any) {
        
        // reference to StoryBoard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // reference to the View Controller you want to goto
        let NotificationSettingsViewController = storyboard.instantiateViewController(identifier: "NotificationsViewController")
        
        // changeRootViewController Function 
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(NotificationSettingsViewController)
        
    }
    
    
    
    
>>>>>>> master:LifeCycle/LifeCycle/TabBar View Controllers/Setting View Controller/SettingsViewController.swift
}
/*extension UILabel {
   /* func setPadding() {
        let paddingview = UIView(frame:CGRect(x: 0,y: 0, width:10, height: self.frame.height))
        self.leftView = paddingview
        self.leftViewMode = .always
    }*/
    
    func setBottomBorder() {
        self.layer.shadowColor = UIColor.red.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}*/

