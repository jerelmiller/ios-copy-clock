//
//  Alarm.swift
//  CopyClock
//
//  Created by Jerel Miller on 12/28/19.
//  Copyright © 2019 Jerel Miller. All rights reserved.
//

import Foundation

struct Alarm: Hashable, Codable, Identifiable {
  let id = UUID()
  var time = Date()
  var enabled = true
  var label = "Alarm"
  var snooze = true
}
