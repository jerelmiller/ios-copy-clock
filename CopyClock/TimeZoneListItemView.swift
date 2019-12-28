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
  
  var city: String {
    String(timeZone.identifier.split(separator: "/")[1])
  }

  var formattedTime: String {
    let formatter = DateFormatter()
    formatter.timeZone = timeZone
    formatter.dateFormat = "H:mm a"
    
    return formatter.string(from: Date())
  }

  var body: some View {
    HStack {
      VStack(alignment: .leading, spacing: 5) {
        Text("Today, + 1HR")
          .foregroundColor(Color.secondary)
        
        Text(city)
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
    TimeZoneListItemView(
      date: Date(),
      timeZone: TimeZone(identifier: TimeZone.knownTimeZoneIdentifiers.first!)!
    )
      .environment(\.colorScheme, .dark)
  }
}
