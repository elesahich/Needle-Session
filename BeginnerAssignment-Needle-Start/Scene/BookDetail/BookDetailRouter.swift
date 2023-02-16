//
//  BookDetailRouter.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/23.
//  
//

import Foundation
import UIKit

final class BookDetailRouter: BookDetailRouterInterface { }

extension BookDetailRouter {
  static func createModule(from book: Book) -> BookDetailViewController {
    let view = BookDetailViewController(book: book)
    let presenter = BookDetailPresenter()
    let interactor = BookDetailInteractor()
    let router = BookDetailRouter()
    
    view.presenter = presenter
    presenter.interactor = interactor
    presenter.router = router
    
    return view
  }
  
  func popViewController(from view: UIViewController?) {
    view?.navigationController?.popViewController(animated: true)
  }
}
