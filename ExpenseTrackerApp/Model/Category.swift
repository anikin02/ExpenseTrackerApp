//
//  Category.swift
//  ExpenseTrackerApp
//
//  Created by anikin02 on 17.08.2024.
//

import Foundation
import SwiftUI
import RealmSwift

struct Category {
  let category: Categories
  var percent: Int = 0
  var value: Double = 0
  
  init(category: Categories) {
    self.category = category
  }
  
  static func getColor(category: Categories) -> Color {
    switch category {
    case .donation:
      return(.pink)
    case .entertainment:
      return(.brown)
    case .food:
      return(.purple)
    case .health:
      return(.orange)
    case .shopping:
      return(.green)
    case .transportation:
      return(.yellow)
    case .utilities:
      return(.blue)
    }
  }
}

enum Categories: String {
  case donation
  case entertainment
  case food
  case health
  case shopping
  case transportation
  case utilities
}
