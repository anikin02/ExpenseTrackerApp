//
//  LogModel.swift
//  ExpenseTrackerApp
//
//  Created by anikin02 on 19.08.2024.
//

import Foundation
import RealmSwift

class LogModel: Object, ObjectKeyIdentifiable {
  @Persisted(primaryKey: true) var id: ObjectId
  @Persisted var title: String = ""
  @Persisted var category: String = ""
  @Persisted var expense: String = ""
  @Persisted var date: Date = Date()
  
  var categoryEnum: Categories {
    return Categories(rawValue: category) ?? .donation
  }
  
  override class func primaryKey() -> String? {
    "id"
  }
}
