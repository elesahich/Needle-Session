//
//  NewRouter.swift
//  BegineerAssignmnet
//
//  Created by elesahich on 2021/04/21.
//

import UIKit
import RealmSwift

final class NewRouter: NewRouterInterface { }

extension NewRouter {
  static func createModule() -> UIViewController {
    let interactor = NewInteractor()
    let presenter = NewPresenter()
    let router = NewRouter()
    let view = NewViewController()
    presenter.interactor = interactor
    presenter.router = router
    view.presenter = presenter

    return view
  }
  
  func showBookDetail(to model: Book, from view: UIViewController?) {
    let interactor = BookDetailInteractor()
    let router = BookDetailRouter(navigationController: UINavigationController(nibName: nil, bundle: nil))
    let presenter = BookDetailPresenter(
      interactor: interactor,
      router: router
    )
    
    let bookDetailViewController = BookDetailViewController(
      book: model,
      presenter: presenter
    )
    bookDetailViewController.hidesBottomBarWhenPushed = true
    view?.navigationController?.pushViewController(bookDetailViewController, animated: true)
  }
}
