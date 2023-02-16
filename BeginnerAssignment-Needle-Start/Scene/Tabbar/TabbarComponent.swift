//
//  TabbarComponent.swift
//  BeginnerAssignment-Needle-Start
//
//  Created by Ian on 2023/02/14.
//

import UIKit
import NeedleFoundation

// TabbarComponent가 가져야 할 객체에 대해서 서술
final class TabbarComponent: Component<EmptyDependency>, TabbarBuilder {
  var tabbarController: UITabBarController {
    return shared { UITabBarController() }
  }
  
  var newComponent: NewComponent {
    return NewComponent(parent: self)
  }
}

// Tabbar의 ViewController에 대한 인터페이스. 채널식으로는 `CreateModule`을 사용할 것임
protocol TabbarBuilder {
  var tabbarController: UITabBarController { get }
}
