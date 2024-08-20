//
//  AddNewLogView.swift
//  ExpenseTrackerApp
//
//  Created by anikin on 18.08.2024.
//

import SwiftUI
import RealmSwift

struct AddNewLogView: View {
  
  @State var titleLog: String = ""
  @State var expense: String = ""
  @State var category: Categories = .donation
  @State var date: Date = Date()
  
  @State var showAlert: Bool = false
  
  @ObservedResults(LogModel.self) var logItems
  
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
      VStack(alignment: .leading) {
        HStack {
          TextField("Title", text: $titleLog)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 5)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
        HStack {
          TextField("Expense", text: $expense)
            .keyboardType(.decimalPad)
            .onReceive(expense.publisher.collect()) { input in
              let filtered = input.filter { "0123456789.".contains($0) }
              if filtered != input {
                self.expense = String(filtered)
              }
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 5)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        HStack {
          Text("Category")
          Spacer()
          Picker("Category", selection: $category) {
            Text("Donation")
              .tag(Categories.donation)
            Text("Entertainment")
              .tag(Categories.entertainment)
            Text("Food")
              .tag(Categories.food)
            Text("Health")
              .tag(Categories.health)
            Text("Shopping")
              .tag(Categories.shopping)
            Text("Transportation")
              .tag(Categories.transportation)
            Text("Utilities")
              .tag(Categories.utilities)
          }
          .tint(Color(.systemGray2))
        }
        
        HStack {
          DatePicker("Date", selection: $date, displayedComponents: .date)
            .datePickerStyle(.compact)
        }
        Spacer()
      }
      .padding(.horizontal, 25)
      .padding(.top, 25)
    }
    .navigationTitle("Edit Expense Log")
    .toolbarTitleDisplayMode(.large)
    .toolbar(content: {
      Button{
        
        if titleLog.count == 0 && expense.count == 0 {
          showAlert.toggle()
        } else {
          let log = LogModel()
          log.title = titleLog
          log.date = date
          log.expense = expense
          log.category = category.rawValue
          
          $logItems.append(log)
          presentationMode.wrappedValue.dismiss()
        }
      } label: {
        Text("Save")
      }
      .alert(Text("Empty fields"), isPresented: $showAlert, actions: {})
    })
  }
}

#Preview {
  NavigationStack {
    AddNewLogView()
  }
}
