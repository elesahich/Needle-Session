//
//  RootComponent.swift
//  BeginnerAssignment-Needle-Start
//
//  Created by Ian on 2023/02/14.
//

import UIKit
import NeedleFoundation

// Root. 즉 AppDelegate 또는 SceneDelegate가 가져야 할 객체에 대해서 서술.
final class RootComponent: BootstrapComponent {
  var tabRouter: TabbarRouter {
    return TabbarRouter(
      tabbarController: self.tabbarComponent.tabbarController,
      newBuilder: self.tabbarComponent.newComponent
    )
  }
}

// MARK: - Component
// 프로덕트에서는 Root Dependency와 Component를 extension 레벨로 구분하여 관리.
extension RootComponent {
  var tabbarComponent: TabbarComponent {
    return TabbarComponent(parent: self)
  }
}

// MARK: - Dependency
extension RootComponent {
  var network: Networking {
    return NetworkingService()
  }
}
