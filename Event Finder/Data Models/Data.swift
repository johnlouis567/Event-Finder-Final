//
//  Data.swift
//  Event Finder
//
//  Created by John Ingram on 4/11/23.
//

import Foundation

@MainActor
class Data: ObservableObject {
    var embeddedData = EmbeddedData()
    @Published var events: [Event] = []
    
    let apiKey = "5f3VlQegvbNmEFdPG3AUHB9FFTRswMDX"
    let urlString = "https://app.ticketmaster.com/discovery/v2/events?"
    
    let dateFormatter = DateFormatter()
    
    // Variables for making api call
    var city = ""
    var startDate = Date()
    var endDate = Date(timeInterval: 2_628_000, since: Date())
    var eventName = ""
    
    func fetchEvents() async {
        var currentUrlString = urlString
        // Update the url based on search vars
        if eventName != "" {
            currentUrlString = "\(currentUrlString)keyword=\(eventName)&"
        }
        if city != "" {
            currentUrlString = "\(currentUrlString)city=\(city)&"
        }
        currentUrlString = "\(currentUrlString)startDateTime=\(startDate.stringFormat)&"
        currentUrlString = "\(currentUrlString)endDateTime=\(endDate.stringFormat)&"
        
        
        let url = URL(string: "\(currentUrlString)apikey=\(apiKey)")
        
        // Unwrap the url to make sure that it is not null
        guard let unwrappedUrl = url else {
            print("There was an error unwrapping the URL")
            return
        }
        
        let session = URLSession.shared
        do {
            let (data, _) = try await session.data(from: unwrappedUrl)
            let decoder = JSONDecoder()
            embeddedData.self = try decoder.decode(EmbeddedData.self, from: data)
            
            // Create an eventsList array so that it updates all at once instead of piece by piece
            var eventsList: [Event] = []
            
            
            // Generate the list of events ffrom the _embedded file
            for event in embeddedData._embedded.events {
                eventsList.append(event)
            }
        
            self.events = eventsList
        } catch {
            self.events = []
            debugPrint("Error loading \(String(describing: url)): \(String(describing: error))")
        }
    }
}

extension Date {
    var stringFormat: String {
        self.formatted(.dateTime.year()) + "-" + self.formatted(.dateTime.month(.twoDigits)) + "-" + self.formatted(.dateTime.day(.twoDigits)) + "T" + self.formatted(.dateTime.hour(.twoDigitsNoAMPM)) + ":" + self.formatted(.dateTime.minute(.twoDigits)) + ":" + self.formatted(.dateTime.second(.twoDigits)) + "Z"
    }
}
