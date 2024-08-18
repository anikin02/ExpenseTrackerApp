//
//  DashboardView.swift
//  ExpenseTrackerApp
//
//  Created by anikin02 on 17.08.2024.
//

import SwiftUI
import Charts

struct DashboardView: View {
  
  @State var dataTest: [Category] = [
    .init(category: .shoping, percent: 40),
    .init(category: .health, percent: 20),
    .init(category: .food, percent: 30),
    .init(category: .donation, percent: 10)
  ]
  
  var body: some View {
    VStack {
      VStack(spacing: 8) {
        Text("Total expenses")
          .font(.system(size: 20, weight: .black))
        Text("$313.99")
          .font(.system(size: 40, weight: .bold))
      }
      .padding(.bottom, 20)
      
      Chart(dataTest, id: \.name) { item in
        SectorMark(angle: .value("Data", item.percent))
          .foregroundStyle(item.color)
      }
      .frame(height: 230)
      .padding(.bottom, 20)
      
      VStack(alignment: .leading, spacing: 8) {
        Text("Categories")
          .font(.system(size: 18, weight: .bold))
          .padding(.horizontal, 20)
        
        List {
          CategoryListItem()
          CategoryListItem()
          CategoryListItem()
          CategoryListItem()
          CategoryListItem()
          CategoryListItem()
          CategoryListItem()
        }
        .scrollIndicators(.hidden)
        .listStyle(.inset)
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
  }
}

struct CategoryListItem: View {
  var body: some View {
    HStack {
      HStack {
        ZStack() {
          Circle()
            .frame(width: 30, height: 30)
            .foregroundStyle(Color.green)
          Image(systemName: "basket")
        }
        Text("Shoping")
          .font(.system(size: 15))
      }
      
      Spacer()
      
      Text("$99.00")
        .bold()
    }
  }
}

#Preview {
  DashboardView()
}
