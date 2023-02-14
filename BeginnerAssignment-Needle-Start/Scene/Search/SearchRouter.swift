//
//  SearchRouter.swift
//  BegineerAssignmnet
//
//  Created by elesahich on 2021/04/21.
//

import UIKit
import RealmSwift

final class SearchRouter: SearchRouterInterface { }

extension SearchRouter {
  static func createModule() -> UIViewController {
    let interactor = SearchInteractor()
    let presenter = SearchPresenter()
    let router = SearchRouter()
    let view = SearchViewController()
    
    presenter.interactor = interactor
    presenter.router = router
    view.presenter = presenter
    
    return view
  }
}

extension SearchRouter {
  func showBookDetail(to model: Book) {
//    let interactor = BookDetailInteractor()
//    let router = BookDetailRouter(navigationController: navigationController)
//    let presenter = BookDetailPresenter(
//      interactor: interactor,
//      router: router
//    )
//
//    let bookDetailViewController = BookDetailViewController(
//      book: model,
//      presenter: presenter
//    )
//    bookDetailViewController.hidesBottomBarWhenPushed = true
//    navigationController.pushViewController(bookDetailViewController, animated: true)
  }
}
