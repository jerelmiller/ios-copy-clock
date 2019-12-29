//
//  TimeZone+Identifiable.swift
//  CopyClock
//
//  Created by Jerel Miller on 12/28/19.
//  Copyright © 2019 Jerel Miller. All rights reserved.
//

import Foundation

extension TimeZone: Identifiable {
  public var id: String {
    identifier
  }
}
