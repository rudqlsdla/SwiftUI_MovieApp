//
//  Review.swift
//  iOSMovie
//
//  Created by 임경빈 on 3/3/24.
//

import Foundation
import RealmSwift

struct ReviewData {
  var rating: Int = 0
  var performance: EvaluationType = .none
  var story: EvaluationType = .none
  var sound: EvaluationType = .none
  var record: String = ""
  var isCompleted: Bool {
    rating != 0 && performance != .none && story != .none && sound != .none
  }
}

enum EvaluationItem {
  case performance
  case story
  case sound
}

extension EvaluationItem {
  var title: String {
    switch self {
    case .performance:
      "performance"
    case .story:
      "story"
    case .sound:
      "sound"
    }
  }
}

enum EvaluationType: Int, PersistableEnum {
  case bad
  case soso
  case good
  case none
}

extension EvaluationType {
  var title: String {
    switch self {
    case .bad:
      "bad"
    case .soso:
      "soso"
    case .good:
      "good"
    case .none:
      ""
    }
  }
}
