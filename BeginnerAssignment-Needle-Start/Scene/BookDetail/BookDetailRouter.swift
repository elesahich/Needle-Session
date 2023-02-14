//
//  BookDetailRouter.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/23.
//  
//

import Foundation
import UIKit

final class BookDetailRouter: NavigationRouterType, BookDetailRouterInterface {
  let navigationController: UINavigationController
    
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() { }
  func popViewController() {
    navigationController.popViewController(animated: true)
  }
}
