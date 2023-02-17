//
//  NewRouter.swift
//  BegineerAssignmnet
//
//  Created by elesahich on 2021/04/21.
//

import UIKit
import RealmSwift

final class NewRouter: NewRouterInterface {
  private let bookDetailBuilder: BookDetailBuilder
  
  init(bookDetailBuilder: BookDetailBuilder) {
    self.bookDetailBuilder = bookDetailBuilder
  }
}

extension NewRouter {
  static func createModule(
    network: Networking,
    bookDetailBuilder: BookDetailBuilder
  ) -> NewViewController {
    let interactor = NewInteractor(network: network)
    let presenter = NewPresenter()
    let router = NewRouter(bookDetailBuilder: bookDetailBuilder)
    let view = NewViewController()
    presenter.interactor = interactor
    presenter.router = router
    view.presenter = presenter

    return view
  }
  
  func showBookDetail(to model: Book, from view: UIViewController?) {
    let controller = self.bookDetailBuilder.createModule(book: model)
    view?.navigationController?.pushViewController(controller, animated: true)
  }
}
