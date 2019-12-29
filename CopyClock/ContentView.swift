//
//  ContentView.swift
//  CopyClock
//
//  Created by Jerel Miller on 12/28/19.
//  Copyright © 2019 Jerel Miller. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State private var timer: Timer?
  @State private var now = Date()
  @State private var timeZones = [TimeZone]()

  var body: some View {
    TabView {
      WorldClockListView(
        date: self.now,
        timeZones: $timeZones,
        onSelect: { self.timeZones.append($0) }
      )
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
          Text("Bedtime")
      }
      
      Text("Stopwatch")
        .tabItem {
          Image(systemName: "stopwatch.fill")
          Text("Stopwatch")
      }
      
      Text("Timer")
        .tabItem {
          Image(systemName: "timer")
          Text("Timer")
      }
    }
    .accentColor(Color.orange)
    .onAppear(perform: createTimer)
    .onDisappear(perform: stopTimer)
  }
  
  func createTimer() {
    timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
      self.now = Date()
    }
  }
  
  func stopTimer() {
    timer?.invalidate()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().environment(\.colorScheme, .dark)
  }
}
