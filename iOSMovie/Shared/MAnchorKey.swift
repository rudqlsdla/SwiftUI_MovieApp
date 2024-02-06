//
//  MAnchorKey.swift
//  iOSMovie
//
//  Created by 임경빈 on 1/30/24.
//

import SwiftUI

struct MAnchorKey: PreferenceKey {
  static var defaultValue: [String: Anchor<CGRect>] = [:]
  static func reduce(value: inout [String : Anchor<CGRect>], nextValue: () -> [String : Anchor<CGRect>]) {
    value.merge(nextValue()) { $1 }
  }
}
