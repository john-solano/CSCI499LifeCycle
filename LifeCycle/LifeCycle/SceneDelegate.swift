//
//  SceneDelegate.swift
//  LifeCycle
//
//  Created by John Solano on 9/18/20.
//  Copyright © 2020 John Solano. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }

        
        // snippet from https://fluffy.es/how-to-transition-from-login-screen-to-tab-bar-controller/
        // if a user signs in and out and back in, it wont create multiple view controllers stacked
        // on top of each other, it will delete the old one and minimize the memory being used
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // if user is logged in before
        if let loggedUsername = UserDefaults.standard.string(forKey: "username") {
            // instantiate the main tab bar controller and set it as root view controller
            // using the storyboard identifier we set earlier
            let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
            window?.rootViewController = mainTabBarController
        } else {
            // if user isn't logged in
            // instantiate the navigation controller and set it as root view controller
            // using the storyboard identifier we set earlier
            let loginNavController = storyboard.instantiateViewController(identifier: "LoginNavigationController")
            window?.rootViewController = loginNavController
        }
        // end of snippet
        
    }
 
 

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    // This handles the change in View Controllers and its animation
    // Ex of how to use:
    // (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    
    func changeRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard let window = self.window else {
            return
        }
        
        // change the root view controller to your specific view controller
        window.rootViewController = vc
        
        // add animation
        UIView.transition(with: window, duration: 1,
                          options: .transitionFlipFromLeft,
                            //options: .transitionCrossDissolve,
                          //options: .transitionCurlUp,
                          animations: nil, completion: nil)
    }


}

