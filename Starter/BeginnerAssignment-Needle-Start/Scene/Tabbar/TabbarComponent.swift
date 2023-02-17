//
//  TabbarComponent.swift
//  BeginnerAssignment-Needle-Start
//
//  Created by Ian on 2023/02/14.
//

import UIKit
import NeedleFoundation

final class TabbarComponent: Component<EmptyDependency>, TabbarBuilder {
  var tabbarController: UITabBarController {
    return shared { UITabBarController() }
  }
}

protocol TabbarBuilder {
  var tabbarController: UITabBarController { get }
}
