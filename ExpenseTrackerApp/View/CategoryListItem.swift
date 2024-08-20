//
//  CategoryListItem.swift
//  ExpenseTrackerApp
//
//  Created by anikin02 on 21.08.2024.
//

import SwiftUI

struct CategoryListItem: View {
  var category: Category
  var body: some View {
    HStack {
      HStack {
        IconCategoryView(category: category.category)
        Text(category.category.rawValue.capitalized)
          .font(.system(size: 15))
      }
      
      Spacer()
      
      Text(String(format: "$%.2f", category.value))
        .bold()
    }
  }
}
