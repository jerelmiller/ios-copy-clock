//
//  ContentView.swift
//  CopyClock
//
//  Created by Jerel Miller on 12/28/19.
//  Copyright © 2019 Jerel Miller. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  let date = Date()

  var body: some View {
    TabView {
      WorldClockListView(date: self.date, timeZones: [TimeZone.current])
        .tabItem {
          Image(systemName: "globe")
          Text("World Clock")
        }

      Text("Alarm")
        .tabItem {
          Image(systemName: "alarm.fill")
          Text("Alarm")
        }
      
      Text("Bedtime")
        .tabItem {
          Image(systemName: "bed.double.fill")
          Text("Alarm")
      }
      
      Text("Stopwatch")
        .tabItem {
          Image(systemName: "stopwatch.fill")
          Text("Alarm")
      }
      
      Text("Timer")
        .tabItem {
          Image(systemName: "timer")
          Text("Alarm")
      }
    }
    .accentColor(Color.orange)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().environment(\.colorScheme, .dark)
  }
}
