//
//  TabbarRouter.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/21.
//

import UIKit

enum TabbarChildType: Int {
  case new
  case search
}

final class TabbarRouter {
  let tabbarController: UITabBarController
  private var childRouters: [TabbarChildType: UINavigationController]
  
  init(
    tabbarController: UITabBarController
  ) {
    self.tabbarController = tabbarController
    self.childRouters = [:]
  }
}

extension TabbarRouter {
  func start() {
    setupNewViewRouter()
    setupSearchViewRouter()
    
    setupTabbarController()
  }
  
  
  private func store(with router: UINavigationController, as type: TabbarChildType) {
    childRouters[type] = router
  }
}

extension TabbarRouter {
  private func setupNewViewRouter() {
    let controller = NewRouter.createModule()
    let newNavigationController = configureNavigationControllerWithTabs(
      title: "New",
      image: UIImage(systemName: "bus"),
      viewController: controller
    )
    
    store(with: newNavigationController, as: .new)
  }
  
  private func setupSearchViewRouter() {
    let controller = SearchRouter.createModule()
    let searchNavigationController = configureNavigationControllerWithTabs(
      title: "Search",
      image: UIImage(systemName: "hammer"),
      viewController: controller
    )
    
    store(with: searchNavigationController, as: .search)
  }
}

extension TabbarRouter {
  private func setupTabbarController() {
    self.tabbarController.tabBar.tintColor = Theme.Colors.PrimaryColor.mainColor
    self.tabbarController.viewControllers = self.childRouters
      .sorted(by: { $0.0.rawValue < $1.0.rawValue })
      .map { $0.value }
  }
}

extension TabbarRouter {
  private func configureNavigationControllerWithTabs(title: String, image: UIImage?, viewController: UIViewController) -> UINavigationController {
    let navigationController: UINavigationController = {
      $0.tabBarItem.title = title
      $0.tabBarItem.image = image
      return $0
    }(UINavigationController(rootViewController: viewController))
    return navigationController
  }
}
