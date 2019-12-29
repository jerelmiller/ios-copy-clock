//
//  TimeZoneListItemView.swift
//  CopyClock
//
//  Created by Jerel Miller on 12/28/19.
//  Copyright © 2019 Jerel Miller. All rights reserved.
//

import SwiftUI

struct TimeZoneListItemView: View {
  let date: Date
  let currentTimeZone = TimeZone.current
  let timeZone: TimeZone
  
  var timeDifference: String {
    let seconds =
      timeZone.secondsFromGMT(for: date) - currentTimeZone.secondsFromGMT()
    let hours = seconds / 60 / 60
    let minutes = seconds / 60 % 60
    let sign = seconds < 0 ? "-" : "+"

    if minutes == 0 {
      return sign + String(hours) + (hours == 1 ? "HR" : "HRS")
    }

    return "\(sign)\(hours):\(minutes)"
  }
  
  var relativeDay: String {
    let calendar = Calendar.current
    let days =
      (calendar.dateComponents(in: timeZone, from: date).day ?? 0) -
        (calendar.dateComponents(in: currentTimeZone, from: date).day ?? 0)

    switch days {
      case -1:
        return "Yesterday"
      case 1:
        return "Tomorrow"
      default:
        return "Today"
    }
  }

  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text("\(relativeDay), \(timeDifference)")
          .font(.subheadline)
          .foregroundColor(Color.secondary)
        
        Text(timeZone.city)
          .font(.title)
          .foregroundColor(Color.primary)
      }
      
      Spacer()
      
      TimeView(date: date, timeZone: timeZone)
    }
  }
}

struct TimeZoneListItemView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      TimeZoneListItemView(
        date: Date(),
        timeZone: TimeZone(identifier: "America/Los_Angeles")!
      )
      
      TimeZoneListItemView(
        date: Date(),
        timeZone: TimeZone(identifier: "Australia/Adelaide")!
      )
    }
  }
}
