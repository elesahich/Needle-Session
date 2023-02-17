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

// Tabbar 전용 Router class
final class TabbarRouter {
  let tabbarController: UITabBarController
  
  /// tabbar에서는 New, Search ViewController로 이동할 수 있으므로 이 클래스 내부에 각 컴포넌트의 `builder`를 가집니다.
  private let newBuilder: NewBuilder
  private let searchBuilder: SearchBuilder
  private var childRouters: [TabbarChildType: UINavigationController]
  
  init(
    tabbarController: UITabBarController,
    newBuilder: NewBuilder,
    searchBuilder: SearchBuilder
  ) {
    self.tabbarController = tabbarController
    self.newBuilder = newBuilder
    self.searchBuilder = searchBuilder
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
    /// `NewRouter.createModule` static 함수를 직접 호출하지 않습니다.
    let controller = self.newBuilder.createModule()
    let newNavigationController = configureNavigationControllerWithTabs(
      title: "New",
      image: UIImage(systemName: "bus"),
      viewController: controller
    )
    
    store(with: newNavigationController, as: .new)
  }
  
  private func setupSearchViewRouter() {
    /// `SearchRouter.createModule` static 함수를 직접 호출하지 않습니다.
    let controller = self.searchBuilder.createModule()
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
