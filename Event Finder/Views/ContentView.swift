//
//  ContentView.swift
//  Event Finder
//
//  Created by John Ingram on 4/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var data = Data()
    
    var body: some View {
        VStack {
            EventSelectionView(data: data, events: $data.events, city: $data.city, eventName: $data.eventName, startDate: $data.startDate, endDate: $data.endDate)
            Spacer()
            Divider()
            Spacer()
            EventsView(events: data.events)
        }
        .padding()
    }
}

/*struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}*/
