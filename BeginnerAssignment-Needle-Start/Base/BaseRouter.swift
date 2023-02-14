//
//  BaseRouter.swift
//  BeginnerAssignment-Needle-Start
//
//  Created by Ian on 2023/02/14.
//

import Foundation
import UIKit

protocol BaseRouterType: AnyObject {
  func start()
}

protocol NavigationRouterType: BaseRouterType {
  var navigationController: UINavigationController { get }
}
