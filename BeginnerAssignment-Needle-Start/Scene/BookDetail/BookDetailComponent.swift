//
//  BookDetailComponent.swift
//  BeginnerAssignment-Needle-Start
//
//  Created by Ian on 2023/02/16.
//

import NeedleFoundation
import UIKit

protocol BookDetailProtocol: Dependency {
  
}

final class BookDetailComponent: Component<BookDetailProtocol>, BookDetailBuilder {
  func createModule(book: Book) -> BookDetailViewController {
    return BookDetailRouter.createModule(from: book)
  }
}

protocol BookDetailBuilder {
  func createModule(book: Book) -> BookDetailViewController
}
