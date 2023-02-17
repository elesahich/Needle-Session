//
//  NewInteractor.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/22.
//

import Foundation
import RxSwift

final class NewInteractor: NewInteractorInterface {
  let networking: Networking
  
  init(network: Networking) {
    self.networking = network
  }
}

extension NewInteractor {
  private func fetchNewBookListEndpoint() -> Endpoint<NewBookResponseType<Book>> {
    let url = URLBuilder()
      .set(path: "new")
      .build()!
    
    return Endpoint(method: .get, url: url)
  }
  
  func fetchNewBookfromAPI() -> Observable<[Book]> {
    return networking
      .requestObservable(fetchNewBookListEndpoint())
      .map { $0.books }
  }
}
