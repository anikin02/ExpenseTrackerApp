//
//  LogsView.swift
//  ExpenseTrackerApp
//
//  Created by anikin02 on 17.08.2024.
//

import SwiftUI

struct LogsView: View {
  @State var searchText = ""
  @State var sortBy: SwitchOption = .calendar
  @State var orderBy: SwitchOption = .asc

  var body: some View {
    ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
      ScrollView(.vertical, showsIndicators: false) {
        VStack {
          // Search bar
          HStack {
            Image(systemName: "magnifyingglass")
              .resizable()
              .frame(width: 15, height: 15)
            TextField("Search", text: $searchText)
          }
          .frame(maxWidth: .infinity)
          .padding(.horizontal, 20)
          .padding(.vertical, 10)
          .background(Color(.systemGray6))
          .clipShape(RoundedRectangle(cornerRadius: 10))
          .padding(.horizontal, 10)
          
          // Filter
          Divider()
          ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
              FilterItem()
              FilterItem()
              FilterItem()
              FilterItem()
              FilterItem()
            }
            .padding(.horizontal, 25)
          }
          
          .frame(maxWidth: .infinity)
          
          // Sort by and Order by
          Divider()
          HStack {
            SwitchButton(headline: "Sort by", firstOptionImage: Image(systemName: "calendar"), secondOptionImage: Image(systemName: "dollarsign.circle"), firstOption: .calendar, secondOption: .money, optionButtonSelected: $sortBy)
            SwitchButton(headline: "Order by", firstOptionImage: Image(systemName: "arrow.up"), secondOptionImage: Image(systemName: "arrow.down"), firstOption: .asc, secondOption: .desc, optionButtonSelected: $orderBy)
          }
          .frame(alignment: .leading)
          .padding(.horizontal, 15)
          
          // List
          Divider()
          
          VStack {
          }

        }
      }
    }
    .navigationTitle("Expense Logs")
    .toolbarTitleDisplayMode(.inline)
    .toolbar(content: {
      Button{
        
      } label: {
        Text("Add log")
      }
    })

    
  }
}

struct FilterItem: View {
  var body: some View {
    ZStack {
      Button {
        
      } label: {
        ZStack {
          RoundedRectangle(cornerRadius: 10)
            .padding(1)
            .shadow(color: .gray, radius: 1)
            .foregroundStyle(.white)
          Text("Shoping")
            .foregroundStyle(.gray)
            .padding(10)
        }
      }

    }
  }
}

struct SwitchButton: View {
  let headline: String
  let firstOptionImage: Image
  let secondOptionImage: Image
  let firstOption: SwitchOption
  let secondOption: SwitchOption
  @Binding var optionButtonSelected: SwitchOption
  
  var body: some View {
    HStack {
      Text(headline)
      
      ZStack {
        RoundedRectangle(cornerRadius: 10)

          .foregroundStyle(Color(.systemGray5))
        HStack {
          Button {
            if optionButtonSelected != firstOption {
              optionButtonSelected = firstOption
            }
          } label: {
            ZStack {
              RoundedRectangle(cornerRadius: 5)
                .padding(4)
                .foregroundStyle(optionButtonSelected == firstOption ? Color(.white) : Color(.systemGray5))
              firstOptionImage
                .foregroundStyle(.black)
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
            }
          }
          Button {
            if optionButtonSelected != secondOption {
              optionButtonSelected = secondOption
            }
          } label: {
            ZStack {
              RoundedRectangle(cornerRadius: 5)
                .padding(4)
                .foregroundStyle(optionButtonSelected == secondOption ? Color(.white) : Color(.systemGray5))
              secondOptionImage
                .foregroundStyle(.black)
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
            }
          }
        }
      }
    }
  }
}

enum SwitchOption {
  case asc
  case desc
  case calendar
  case money
  
  case defaultOption
}

#Preview {
  LogsView()
}
