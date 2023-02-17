//
//  SearchBookResponse.swift
//  BeginnerAssignment-Needle-Start
//
//  Created by Ian on 2023/02/14.
//

import Foundation

struct SearchBookResponse<T>: Decodable where T: Decodable {
  let error: String
  let total: String
  let page: String
  let books: [T]
}
