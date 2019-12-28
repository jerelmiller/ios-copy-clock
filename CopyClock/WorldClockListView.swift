//
//  WorkClockListView.swift
//  CopyClock
//
//  Created by Jerel Miller on 12/28/19.
//  Copyright © 2019 Jerel Miller. All rights reserved.
//

import SwiftUI

struct WorldClockListView: View {
  let date: Date
  let timeZones: [TimeZone]
  
  @State private var showingTimeZones = false
  
  var body: some View {
    NavigationView {
      Group {
        if timeZones.count > 0 {
          List {
            ForEach(timeZones, id: \.self) { timeZone in
              TimeZoneListItemView(date: self.date, timeZone: timeZone)
            }
          }
        } else {
          VStack {
            Spacer()

            Text("No World Clocks")
              .font(.title)
              .foregroundColor(Color.secondary)

            Spacer()
          }
        }
      }
      .navigationBarTitle("World Clock")
      .navigationBarItems(
        leading: EditButton(),
        trailing: Button(action: { self.showingTimeZones = true }) {
          Image(systemName: "plus")
        }
      )
      .sheet(isPresented: $showingTimeZones) {
        Text("Hi")
      }
    }
  }
}

struct WorldClockListView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      WorldClockListView(date: Date(), timeZones: [])
      WorldClockListView(date: Date(), timeZones: [TimeZone.current])
    }
    .accentColor(Color.orange)
  }
}
