//
//  ContentView.swift
//  ExpenseTrackerApp
//
//  Created by anikin02 on 17.08.2024.
//

import SwiftUI

struct ContentView: View {
  @State var selected = 1
  var body: some View {
    TabView(selection: $selected) {
      DashboardView()
        .tabItem {
          Label("Dashboard", systemImage: "list.clipboard.fill")
        }
        .tag(1)
      
      NavigationStack {
        LogsView()
      }
      .tabItem {
        Label("Logs", systemImage: "archivebox.fill")
      }
      .tag(2)
    }
  }
}

#Preview {
  ContentView()
}
