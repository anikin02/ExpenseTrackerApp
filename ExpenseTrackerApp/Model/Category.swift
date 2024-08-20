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
  let percent: Int
  
  var name: String = ""
  var color: Color = .white
  var image: Image = Image(systemName: "questionmark")
  
  init(category: Categories, percent: Int) {
    self.category = category
    self.percent = percent
    
    setFields()
  }
  
  mutating func setFields() {
    switch category {
    case .donation:
      name = "Donation"
      color = .pink
      image = Image(systemName: "heart.circle.fill")
    case .entertainment:
      name = "Entertainment"
      color = .brown
      image = Image(systemName: "music.note.tv")
    case .food:
      name = "Food"
      color = .purple
      image = Image(systemName: "fork.knife.circle")
    case .health:
      name = "Health"
      color = .orange
      image = Image(systemName: "stethoscope")
    case .shopping:
      name = "Shopping"
      color = .green
      image = Image(systemName: "basket")
    case .transportation:
      name = "Transportation"
      color = .yellow
      image = Image(systemName: "car")
    case .utilities:
      name = "Utilities"
      color = .blue
      image = Image(systemName: "lightbulb.min")
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
