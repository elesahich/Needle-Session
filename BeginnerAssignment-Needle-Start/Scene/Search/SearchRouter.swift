//
//  SearchRouter.swift
//  BegineerAssignmnet
//
//  Created by elesahich on 2021/04/21.
//

import UIKit
import RealmSwift

final class SearchRouter: NavigationRouterType, SearchRouterInterface {
  let navigationController: UINavigationController
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    showSearchView()
  }
}

extension SearchRouter {
  private func showSearchView() {
    let interactor = SearchInteractor()
    let presenter = SearchPresenter(
      interactor: interactor,
      router: self
    )

    let searchViewController = SearchViewController(
      presenter: presenter
    )
    navigationController.show(searchViewController, sender: nil)
  }
  
  func showBookDetail(to model: Book) {
    let interactor = BookDetailInteractor()
    let router = BookDetailRouter(navigationController: navigationController)
    let presenter = BookDetailPresenter(
      interactor: interactor,
      router: router
    )
    
    let bookDetailViewController = BookDetailViewController(
      book: model,
      presenter: presenter
    )
    bookDetailViewController.hidesBottomBarWhenPushed = true
    navigationController.pushViewController(bookDetailViewController, animated: true)
  }
}
