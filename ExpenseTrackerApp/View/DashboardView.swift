//
//  DashboardView.swift
//  ExpenseTrackerApp
//
//  Created by anikin02 on 17.08.2024.
//

import SwiftUI
import Charts
import RealmSwift

struct DashboardView: View {
  
  @State var categories: [Category] = [
    .init(category: .donation),
    .init(category: .entertainment),
    .init(category: .food),
    .init(category: .health),
    .init(category: .shopping),
    .init(category: .transportation),
    .init(category: .utilities)
  ]
  
  @ObservedResults(LogModel.self) var logItems
  
  @State var totalValue: Double = 0
  
  var body: some View {
    VStack {
      VStack(spacing: 8) {
        Text("Total monthly expenses")
          .font(.system(size: 20, weight: .black))
        Text(String(format: "$%.2f", totalValue))
          .font(.system(size: 40, weight: .bold))
      }
      .padding(.bottom, 20)
      .onAppear {
        setValues()
      }
      
      Chart(categories, id: \.category.rawValue) { item in
        SectorMark(angle: .value("Data", (item.value / totalValue) * 100))
          .foregroundStyle(Category.getColor(category: item.category))
      }
      .frame(height: 230)
      .padding(.bottom, 20)
      
      VStack(alignment: .leading, spacing: 8) {
        Text("Categories")
          .font(.system(size: 18, weight: .bold))
          .padding(.horizontal, 20)
        
        VStack {
          ForEach(categories, id: \.category.rawValue) { category in
            CategoryListItem(category: category)
          }
        }
        .padding(.horizontal, 20)
        .padding(.top, 8)
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
  }
  
  func setValues() {
    var values: [Categories : Double] = [
      .donation: 0.00,
      .entertainment: 0.00,
      .food: 0.00,
      .health: 0.00,
      .shopping: 0.00,
      .transportation: 0.00,
      .utilities: 0.00
    ]
    
    totalValue = 0
    
    for log in logItems {
      values[log.categoryEnum]! += Double(log.expense) ?? 0
      totalValue += Double(log.expense) ?? 0
    }
    
    for index in categories.indices {
      categories[index].value = values[categories[index].category]!
    }
  }
}
