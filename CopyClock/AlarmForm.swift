//
//  AlarmForm.swift
//  CopyClock
//
//  Created by Jerel Miller on 12/28/19.
//  Copyright © 2019 Jerel Miller. All rights reserved.
//

import SwiftUI

struct AlarmForm: View {
  @Binding var alarm: Alarm
  
  var body: some View {
    Form {
      TimePicker(time: self.$alarm.time) {
        Text("Select time")
      }

      TextField("Label", text: $alarm.label)

      Toggle(isOn: $alarm.snooze) {
        Text("Snooze")
      }
    }
  }
}

struct AlarmForm_Previews: PreviewProvider {
  static var previews: some View {
    AlarmForm(alarm: .constant(Alarm()))
  }
}
