//
//  NewComponent.swift
//  BeginnerAssignment-Needle-Start
//
//  Created by Ian on 2023/02/14.
//

import NeedleFoundation

protocol NewDependency: Dependency {
  var network: Networking { get }
}

final class NewComponent: Component<NewDependency>, NewBuilder {
  func createModule() -> NewViewController {
    return NewRouter.createModule(network: dependency.network)
  }
}

protocol NewBuilder {
  func createModule() -> NewViewController
}
