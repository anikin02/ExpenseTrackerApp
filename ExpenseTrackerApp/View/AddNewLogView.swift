//
//  AddNewLogView.swift
//  ExpenseTrackerApp
//
//  Created by anikin on 18.08.2024.
//

import SwiftUI

struct AddNewLogView: View {
  
  @State var titleLog: String = ""
  @State var expense: String = ""
  @State var categoty: Categories = .donation
  @State var date: Date = Date()
  
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
          Picker("Category", selection: $categoty) {
            Text("Donation")
              .foregroundStyle(.gray)
            Text("Entertainment")
              .tag(Categories.entertainment)
            Text("Food")
              .tag(Categories.food)
            Text("Health")
              .tag(Categories.health)
            Text("Shoping")
              .tag(Categories.shoping)
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
        // New log
        presentationMode.wrappedValue.dismiss()
      } label: {
        Text("Save")
      }
    })
  }
}

#Preview {
  NavigationStack {
    AddNewLogView()
  }
}
