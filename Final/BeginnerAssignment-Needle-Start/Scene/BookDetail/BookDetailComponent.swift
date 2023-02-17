//
//  BookDetailComponent.swift
//  BeginnerAssignment-Needle-Start
//
//  Created by Ian on 2023/02/16.
//

import NeedleFoundation
import UIKit
import RealmSwift

/// 의존할 것이 없는 경우에는 `EmptyDependency`를 적용합니다
// protocol BookDetailProtocol: Dependency { }

final class BookDetailComponent: Component<EmptyDependency>, BookDetailBuilder {
  func createModule(book: Book) -> BookDetailViewController {
    return BookDetailRouter.createModule(
      from: book,
      realmObject: try! Realm()
      /// Realm Object는 인스턴스를 공유하지 않고 생성하도록 했습니다 #2868
    )
  }
}

/// BookDetail ViewController의 생성 담당 인터페이스
protocol BookDetailBuilder {
  func createModule(book: Book) -> BookDetailViewController
}
