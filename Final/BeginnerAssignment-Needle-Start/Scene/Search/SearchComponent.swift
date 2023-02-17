//
//  SearchComponent.swift
//  BeginnerAssignment-Needle-Start
//
//  Created by Ian on 2023/02/17.
//

import UIKit
import NeedleFoundation

protocol SearchDependency: Dependency {
  var network: Networking { get }
}

final class SearchComponent: Component<SearchDependency>, SearchBuilder {
  func createModule() -> SearchViewController {
    return SearchRouter.createModule(
      bookDetailBuilder: self.bookDetailComponent,
      networking: dependency.network,
      cacheWrapper: CacheWrapper(base: Cache())
    )
  }
  
  var bookDetailComponent: BookDetailComponent {
    return BookDetailComponent(parent: self)
  }
}

protocol SearchBuilder {
  func createModule() -> SearchViewController
}
