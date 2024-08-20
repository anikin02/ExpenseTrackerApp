//
//  LogItem.swift
//  ExpenseTrackerApp
//
//  Created by anikin02 on 21.08.2024.
//

import SwiftUI

struct LogItem: View {
  let title: String
  let dateString: String
  let expense: String
  let category: Categories
  
  @State var offsetX: CGFloat = 0
  var onDelete: ()->()
  
  var body: some View {
    ZStack(alignment: .trailing) {
      removeImage()
      VStack {
        HStack {
          HStack {
            IconCategoryView(category: category)
            VStack(alignment: .leading) {
              Text(title)
                .font(.system(size: 15, weight: .bold))
              Text(dateString)
                .font(.system(size: 13))
            }
          }
          Spacer()
          
          Text(expense)
            .bold()
        }
        .offset(x: offsetX)
        .gesture(DragGesture()
          .onChanged { value in
            if value.translation.width < 0 {
              offsetX = value.translation.width
            }
          }
          .onEnded { value in
            withAnimation {
              if UIScreen.main.bounds.width * 0.6 < -value.translation.width {
                withAnimation {
                  offsetX = -UIScreen.main.bounds.width
                  onDelete()
                }
              } else {
                offsetX = 0
              }
            }
          }
        )
        Divider()
      }
    }
  }
  
  @ViewBuilder
  func removeImage() -> some View {
    Image(systemName: "xmark")
      .resizable()
      .frame(width: 10, height: 10)
      .offset(x: 30)
      .offset(x: offsetX * 0.5)
      .scaleEffect(CGSize(width: -offsetX * 0.006,
                          height: -offsetX * 0.006))
  }
}
