//
//  TimeZoneSelectionView.swift
//  CopyClock
//
//  Created by Jerel Miller on 12/28/19.
//  Copyright © 2019 Jerel Miller. All rights reserved.
//

import SwiftUI

struct TimeZoneSelectionView: View {
  @Environment(\.presentationMode) var presentationMode
  @State private var searchValue = ""
  
  let onSelect: (TimeZone) -> Void
  
  var timeZones: [TimeZone] {
    let sortedTimeZones = TimeZone.knownTimeZones
      .sorted { $0.region < $1.region }
    
    if searchValue.isEmpty {
      return sortedTimeZones
    }
   
    return sortedTimeZones
      .filter { $0.identifier.contains(searchValue) }
  }

  var body: some View {
    VStack {
      VStack {
        Text("Choose a City")
          .font(.subheadline)
  
        HStack(spacing: 10) {
          SearchField(text: $searchValue)
  
          Button("Cancel", action: dismiss)
        }
      }
      .padding()
      
      List {
        ForEach(timeZones) { timeZone in
          GeometryReader { geometry in
            Button(timeZone.region) {
              self.onSelect(timeZone)
              self.dismiss()
            }
            .frame(
              width: geometry.size.width,
              height: geometry.size.height,
              alignment: .leading
            )
          }
        }
      }
    }
  }
  
  func dismiss() {
    presentationMode.wrappedValue.dismiss()
  }
}

struct TimeZoneSelectionView_Previews: PreviewProvider {
  static var previews: some View {
    TimeZoneSelectionView(onSelect: { _ in })
      .accentColor(Color.orange)
  }
}
