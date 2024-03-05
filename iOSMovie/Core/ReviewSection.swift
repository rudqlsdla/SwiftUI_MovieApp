//
//  ReviewSection.swift
//  iOSMovie
//
//  Created by 임경빈 on 3/5/24.
//

import RealmSwift
import Foundation

class ReviewSection: Object, ObjectKeyIdentifiable {
  @Persisted(primaryKey: true) var id: ObjectId
  @Persisted var title: String
  @Persisted var posterURL: String
  @Persisted var rating: Int
  @Persisted var performance: EvaluationType
  @Persisted var story: EvaluationType
  @Persisted var sound: EvaluationType
  @Persisted var record: String
}
