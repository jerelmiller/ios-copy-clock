//
//  TimeZone+Extensions.swift
//  CopyClock
//
//  Created by Jerel Miller on 12/28/19.
//  Copyright © 2019 Jerel Miller. All rights reserved.
//

import Foundation

extension TimeZone {
  static var knownTimeZones = Self
    .knownTimeZoneIdentifiers
    .compactMap { TimeZone(identifier: $0) }
  
  var city: String {
    let components = identifier.split(separator: "/")
    
    return sanitize(components.last ?? "")
  }
  
  var region: String {
    sanitize(
      identifier
        .split(separator: "/")
        .reversed()
        .joined(separator: ", ")
    )
  }
  
  private func sanitize(_ string: String) -> String {
    string.replacingOccurrences(of: "_", with: " ")
  }
  
  private func sanitize(_ string: String.SubSequence) -> String {
    sanitize(String(string))
  }
}
