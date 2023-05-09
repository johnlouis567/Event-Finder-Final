//
//  EventSelectionView.swift
//  Event Finder
//
//  Created by John Ingram on 4/16/23.
//

import SwiftUI

struct EventSelectionView: View {
    @ObservedObject private var autocomplete = AutocompleteObject()
    
    var data: Data
    @Binding var events: [Event]
    @Binding var city: String
    @Binding var eventName: String
    @Binding var startDate: Date
    @Binding var endDate: Date
    @State var input: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Button("Populate Events") {
                    Task {
                        city = input
                        await self.data.fetchEvents()
                    }
                }
                // TODO: Implement a button to refresh events?
                Button("Clear Events") {
                    events = []
                    city = ""
                    eventName = ""
                    input = ""
                    startDate = Date()
                    endDate = Date(timeInterval: 2_628_000, since: Date())
                }
            }
            Divider()
            VStack {
                TextField("Event Name: ", text: $eventName)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                VStack {
                    TextField("City: ", text: $input)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                        .onChange(of: input) { newValue in
                            autocomplete.autocomplete(input)
                        }
                }
                List(autocomplete.suggestions, id: \.self) { suggestion in
                    ZStack {
                        Text(suggestion)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .onTapGesture {
                        input = suggestion
                        city = suggestion
                    }
                }
                HStack {
                    DatePicker("Starting Date: ", selection: $startDate, displayedComponents: [.date])
                    DatePicker("Ending Date: ", selection: $endDate, displayedComponents: [.date])
                }
            }
        }
    }
}

/*struct EventSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        EventSelectionView()
    }
}*/
