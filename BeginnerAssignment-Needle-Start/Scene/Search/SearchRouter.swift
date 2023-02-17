//
//  SearchRouter.swift
//  BegineerAssignmnet
//
//  Created by elesahich on 2021/04/21.
//

import UIKit
import RealmSwift

final class SearchRouter: SearchRouterInterface {
  private let bookdetailBuilder: BookDetailBuilder
  
  init(bookdetailBuilder: BookDetailBuilder) {
    self.bookdetailBuilder = bookdetailBuilder
  }
}

extension SearchRouter {
  static func createModule(
    bookDetailBuilder: BookDetailBuilder,
    networking: Networking,
    cacheWrapper: CacheWrapper<String, [Book]>
  ) -> SearchViewController {
    let interactor = SearchInteractor(
      networking: networking,
      cacheWrapper: cacheWrapper
    )
    let presenter = SearchPresenter()
    let router = SearchRouter(bookdetailBuilder: bookDetailBuilder)
    let view = SearchViewController()
    
    presenter.interactor = interactor
    presenter.router = router
    view.presenter = presenter
    
    return view
  }
}

extension SearchRouter {
  func showDetailViewController(to model: Book, from view: UIViewController?) {
    let controller = self.bookdetailBuilder.createModule(book: model)
    view?.navigationController?.pushViewController(controller, animated: true)
  }
}
