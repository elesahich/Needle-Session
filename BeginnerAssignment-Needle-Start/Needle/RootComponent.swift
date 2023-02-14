//
//  RootComponent.swift
//  BeginnerAssignment-Needle-Start
//
//  Created by Ian on 2023/02/14.
//

import UIKit
import NeedleFoundation

final class RootComponent: BootstrapComponent {
  var tabRouter: TabbarRouter {
    return TabbarRouter(tabbarBuilder: self.tabbarComponent)
  }
}

// MARK: - Component
extension RootComponent {
  var tabbarComponent: TabbarComponent {
    return TabbarComponent(parent: self)
  }
}
