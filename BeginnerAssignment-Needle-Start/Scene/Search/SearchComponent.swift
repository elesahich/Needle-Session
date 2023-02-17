//
//  SearchComponent.swift
//  BeginnerAssignment-Needle-Start
//
//  Created by Ian on 2023/02/17.
//

import UIKit
import NeedleFoundation

protocol SearchDependency: Dependency {
  
}

final class SearchComponent: Component<SearchDependency>, SearchBuilder {
  func createModule() -> SearchViewController {
    return SearchRouter.createModule(bookDetailBuilder: self.bookDetailComponent)
  }
  
  var bookDetailComponent: BookDetailComponent {
    return BookDetailComponent(parent: self)
  }
}

protocol SearchBuilder {
  func createModule() -> SearchViewController
}
