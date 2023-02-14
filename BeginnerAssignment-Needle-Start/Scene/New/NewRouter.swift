//
//  NewRouter.swift
//  BegineerAssignmnet
//
//  Created by elesahich on 2021/04/21.
//

import UIKit
import RealmSwift

final class NewRouter: NavigationRouterType, NewRouterInterface {
  let navigationController: UINavigationController
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    showNewBookList()
  }
}

extension NewRouter {
  private func showNewBookList() {
    let interactor = NewInteractor()
    let presenter = NewPresenter(
      router: self,
      interactor: interactor
    )
    
    let viewController = NewViewController(presenter: presenter)
    navigationController.show(viewController, sender: nil)
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
