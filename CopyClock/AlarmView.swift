//
//  AlarmView.swift
//  CopyClock
//
//  Created by Jerel Miller on 12/28/19.
//  Copyright © 2019 Jerel Miller. All rights reserved.
//

import SwiftUI

struct AlarmView: View {
  @Binding var alarms: [Alarm]
  @State private var showingForm = false
  @State private var alarm = Alarm()
  
  var body: some View {
    NavigationView {
      VStack {
        Section(
          header: HStack {
            Image(systemName: "bed.double.fill")
            Text("Bedtime".uppercased())
          }
          .foregroundColor(Color.secondary)
        ) {
          Text("one")
        }

        Section(
          header: Text("Other Alarms".uppercased())
            .foregroundColor(Color.secondary)
        ) {
          ForEach(alarms) { alarm in
            TimeView(date: alarm.time)
          }
        }
      }
      .padding()
      .navigationBarTitle("Alarm")
      .navigationBarItems(
        leading: EditButton(),
        trailing: Button(action: { self.showingForm = true }) {
          Image(systemName: "plus")
        }
      )
      .sheet(isPresented: $showingForm) {
        AlarmForm(alarm: self.$alarm)
      }
    }
  }
}

struct AlarmView_Previews: PreviewProvider {
  static var previews: some View {
    AlarmView(alarms: .constant([]))
      .accentColor(Color.orange)
  }
}
