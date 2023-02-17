//
//  NewComponent.swift
//  BeginnerAssignment-Needle-Start
//
//  Created by Ian on 2023/02/14.
//

import NeedleFoundation

/// 해당 Component에서 사용할 의존성을 정의합니다. 이 경우에는 네트워크 객체를 정의했습니다.
protocol NewDependency: Dependency {
  var network: Networking { get }
}

final class NewComponent: Component<NewDependency>, NewBuilder {
  func createModule() -> NewViewController {
    return NewRouter.createModule(
      network: dependency.network,
      bookDetailBuilder: self.bookDetailComponent
    )
  }
  
  var bookDetailComponent: BookDetailComponent {
    return BookDetailComponent(parent: self)
  }
}

/// New ViewController의 생성 담당 인터페이스
protocol NewBuilder {
  func createModule() -> NewViewController
}
