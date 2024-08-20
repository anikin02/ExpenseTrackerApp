//
//  FilterItem.swift
//  ExpenseTrackerApp
//
//  Created by anikin02 on 21.08.2024.
//

import SwiftUI

struct FilterItem: View {
  @Binding var filter: String
  
  var filterTitle: String
  var color = Color(.gray)
  var body: some View {
    ZStack {
      Button {
        if filter == filterTitle {
          filter = ""
        } else {
          filter = filterTitle
        }
      } label: {
        ZStack {
          RoundedRectangle(cornerRadius: 10)
            .padding(1)
            .shadow(color: filter == filterTitle ? .accentColor : .gray, radius: 1)
            .foregroundStyle(.white)
          Text(filterTitle.capitalized)
            .foregroundStyle(filter == filterTitle ? Color(.accent) : .gray)
            .padding(10)
        }
      }
      
    }
  }
}
