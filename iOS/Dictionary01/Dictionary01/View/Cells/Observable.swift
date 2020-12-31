//
//  Observable.swift
//  Dictionary01
//
//  Created by 김혜빈 on 2020/12/30.
//

import Foundation

final class Observable<T> {
  typealias Listener = (T) -> Void // ❼
  var listener: Listener?
  var value: T {
    didSet { // ❻
      listener?(value) // ❻
    }
  }
  init(_ value: T) {  // ❺
    self.value = value
  }
  func bind(listener: Listener?) {
    self.listener = listener
    listener?(value)
  }
}
