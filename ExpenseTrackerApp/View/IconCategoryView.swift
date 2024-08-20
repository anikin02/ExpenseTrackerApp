//
//  IconCategoryView.swift
//  ExpenseTrackerApp
//
//  Created by anikin02 on 20.08.2024.
//

import SwiftUI

struct IconCategoryView: View {
  let category: Categories
  
  let color: Color
  let imageName: String
  
  init(category: Categories) {
    self.category = category
    
    let result = IconCategoryView.getFields(category: category)
    self.color = result.0
    self.imageName = result.1
  }
  
  var body: some View {
    ZStack() {
      Circle()
        .frame(width: 30, height: 30)
        .foregroundStyle(color)
      Image(systemName: imageName)
    }
  }
  
  static func getFields(category: Categories) -> (Color, String) {
    switch category {
    case .donation:
      return(.pink, "heart.circle.fill")
    case .entertainment:
      return(.brown, "music.note.tv")
    case .food:
      return(.purple, "fork.knife.circle")
    case .health:
      return(.orange, "stethoscope")
    case .shopping:
      return(.green, "basket")
    case .transportation:
      return(.yellow, "car")
    case .utilities:
      return(.blue, "lightbulb.min")
    }
  }
}
