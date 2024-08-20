//
//  LogsView.swift
//  ExpenseTrackerApp
//
//  Created by anikin02 on 17.08.2024.
//

import SwiftUI
import RealmSwift

struct LogsView: View {
  @State var searchText = ""
  @State var sortBy: String = "date"
  @State var orderBy: Bool = false
  
  @State var filterText: String = ""
  
  @ObservedResults(LogModel.self) var logItems
  
  var body: some View {
    ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
      ScrollView(.vertical, showsIndicators: false) {
        VStack {
          
          // Filter
          Divider()
          ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
              FilterItem(filter: $filterText, filterTitle: "donation")
              FilterItem(filter: $filterText, filterTitle: "entertainment")
              FilterItem(filter: $filterText, filterTitle: "food")
              FilterItem(filter: $filterText, filterTitle: "health")
              FilterItem(filter: $filterText, filterTitle: "shopping")
              FilterItem(filter: $filterText, filterTitle: "transportation")
              FilterItem(filter: $filterText, filterTitle: "utilities")
            }
            .padding(.horizontal, 25)
          }
          
          .frame(maxWidth: .infinity)
          
          // Sort by and Order by
          Divider()
            .padding(.bottom, 2)
          HStack {
            HStack {
              Text("Sort by")
              Picker("Sort by", selection: $sortBy) {
                Image(systemName: "calendar")
                  .tag("date")
                Image(systemName: "dollarsign.circle")
                  .tag("expense")
              }
              .pickerStyle(.palette)
            }
            HStack {
              Text("Order by")
              Picker("Order by", selection: $orderBy) {
                Image(systemName: "arrow.up")
                  .tag(true)
                Image(systemName: "arrow.down")
                  .tag(false)
              }
              .pickerStyle(.palette)
            }
          }
          .frame(alignment: .leading)
          .padding(.horizontal, 15)
          
          // List
          Divider()
          
          VStack {
            ForEach(logItems
              .filter(getFilterSetting())
              .sorted(byKeyPath: sortBy, ascending: orderBy),
                    id: \.id) { log in
              LogItem(title: log.title, dateString: formatDate(log.date), expense: String(format: "$%.2f", Double(log.expense) ?? 0), category: log.categoryEnum) {
                $logItems.remove(log)
              }
            }
          }
          .searchable(text: $searchText, collection: $logItems, keyPath: \.title)
          .padding(.horizontal, 25)
          
        }
      }
    }
    .navigationTitle("Expense Logs")
    .toolbarTitleDisplayMode(.inline)
    .toolbar(content: {
      NavigationLink("Add log", destination: AddNewLogView())
    })
  }
  
  func formatDate(_ date: Date) -> String {
    let calendar = Calendar.current
    
    if calendar.isDateInToday(date) {
      return "Today"
    } else {
      let dateFormatter = DateFormatter()
      dateFormatter.dateStyle = .medium
      return dateFormatter.string(from: date)
    }
  }
  
  func getFilterSetting() -> NSPredicate {
    let predicate: NSPredicate
    if filterText == "" {
      predicate = NSPredicate(value: true)
    } else {
      predicate = NSPredicate(format: "category CONTAINS[c] %@", filterText)
    }
    
    return predicate
  }
}
