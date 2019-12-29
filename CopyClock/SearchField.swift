//
//  SearchField.swift
//  CopyClock
//
//  Created by Jerel Miller on 12/28/19.
//  Copyright © 2019 Jerel Miller. All rights reserved.
//

import SwiftUI

struct SearchField: View {
  let placeholder = "Search"
  @Binding var text: String
  @State private var showCancelButton = false

  var body: some View {
    HStack {
      Image(systemName: "magnifyingglass")
      
      TextField(placeholder, text: $text)
        .foregroundColor(Color.primary)
      
      Button(action: { self.text = "" }) {
        Image(systemName: "xmark.circle.fill")
          .opacity(text.isEmpty ? 0 : 1)
      }
    }
    .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
    .foregroundColor(Color.secondary)
    .background(Color(.secondarySystemBackground))
    .cornerRadius(10)
  }
}

struct SearchField_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      SearchField(text: .constant(""))
      SearchField(text: .constant("with a value"))
    }
  }
}
