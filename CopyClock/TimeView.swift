//
//  TimeView.swift
//  CopyClock
//
//  Created by Jerel Miller on 12/28/19.
//  Copyright © 2019 Jerel Miller. All rights reserved.
//

import SwiftUI

struct TimeView: View {
  let date: Date
  let timeZone: TimeZone
  
  var time: String {
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = timeZone
    dateFormatter.dateFormat = "H:mm"
    
    return dateFormatter.string(from: date)
  }
  
  var amPm: String {
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = timeZone
    dateFormatter.dateFormat = "a"
    
    return dateFormatter.string(from: date)
  }

  var body: some View {
    Text(time)
      .font(Font.system(size: 60))
      .fontWeight(.light)
      .foregroundColor(Color.primary)
    + Text(amPm)
      .font(Font.system(size: 30))
      .foregroundColor(Color.primary)
  }
}

struct TimeView_Previews: PreviewProvider {
  static var previews: some View {
    TimeView(date: Date(), timeZone: TimeZone.current)
  }
}
