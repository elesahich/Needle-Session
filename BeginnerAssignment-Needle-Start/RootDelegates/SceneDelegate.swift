//
//  SceneDelegate.swift
//  BeginnerAssignment-Needle-Start
//
//  Created by Ian on 2023/02/14.
//

import UIKit
import NeedleFoundation

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
    
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    registerProviderFactories()
    
    let rootComponent = RootComponent()
    
    self.window = UIWindow(windowScene: windowScene)
    self.window?.rootViewController = MainViewController()
    self.window?.makeKeyAndVisible()
  }
}
