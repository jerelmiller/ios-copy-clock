//
//  AlarmItemView.swift
//  CopyClock
//
//  Created by Jerel Miller on 12/28/19.
//  Copyright © 2019 Jerel Miller. All rights reserved.
//

import SwiftUI

struct AlarmItemView: View {
  @Binding var alarm: Alarm
  let label = "Alarm"

  var body: some View {
    VStack(alignment: .leading, spacing: -10) {
      Toggle(isOn: $alarm.enabled) {
        TimeView(date: alarm.time)
      }

      Text(label)
    }
    .foregroundColor(alarm.enabled ? Color.primary : Color.secondary)
  }
}

struct AlarmItemView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      AlarmItemView(alarm: .constant(Alarm(time: Date(), enabled: false)))
      AlarmItemView(alarm: .constant(Alarm(time: Date(), enabled: true)))
    }
  }
}
