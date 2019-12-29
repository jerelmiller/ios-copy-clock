//
//  WorkClockListView.swift
//  CopyClock
//
//  Created by Jerel Miller on 12/28/19.
//  Copyright © 2019 Jerel Miller. All rights reserved.
//

import SwiftUI

struct WorldClockView: View {
  let date: Date
  
  @Binding var timeZones: [TimeZone]
  
  let onSelect: (TimeZone) -> Void
  
  @State private var showingTimeZones = false

  var body: some View {
    NavigationView {
      Group {
        if timeZones.count > 0 {
          List {
            ForEach(timeZones, id: \.self) { timeZone in
              TimeZoneListItemView(date: self.date, timeZone: timeZone)
            }
            .onDelete(perform: removeTimeZones)
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
        TimeZoneSelectionView(onSelect: self.onSelect)
          .accentColor(Color.orange)
      }
    }
  }
  
  func removeTimeZones(at offsets: IndexSet) {
    timeZones.remove(atOffsets: offsets)
  }
}

struct WorldClockView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      WorldClockView(date: Date(), timeZones: .constant([]), onSelect: { _ in })
      WorldClockView(
        date: Date(),
        timeZones: .constant([
          TimeZone.current,
          TimeZone(identifier: "Australia/Adelaide")!
        ]),
        onSelect: { _ in }
      )
    }
    .accentColor(Color.orange)
  }
}
