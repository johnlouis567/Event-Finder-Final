//
//  DataCollector.swift
//  Event Finder
//
//  Created by John Ingram on 4/10/23.
//

// Fetch events function was inspired by: https://www.freecodecamp.org/news/how-to-make-your-first-api-call-in-swift/

import Foundation

class DataCollector {
    let apiKey = "5f3VlQegvbNmEFdPG3AUHB9FFTRswMDX"
    let domainUrlString = "https://app.ticketmaster.com/discovery/v2"
//    var events: [Event] = []
    
    /*func fetchEvents(completionHandler: @escaping (_ success: Bool, _ event: Event?) -> Void) {
        let url = URL(string: domainUrlString + "/events")
        
        // Unwrap the url to make sure that it is not null
        guard let unwrappedUrl = url else {
            // TODO: Implelemnt an error
            print("There was an error unwrapping the URL")
            return
        }
        
        
        
        let task = URLSession.shared.dataTask(with: unwrappedUrl, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching events: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(response)")
                return
            }
            
            if let data = data {
                if let eventSummary = try? JSONDecoder().decode(Event.self, from: data) {
                    completionHandler(true, eventSummary)
                }
            } else {
                completionHandler(false, nil)
            }
        })
        task.resume()
    }*/
    
    /*private func fetchEvents() async throws -> [Event] {
        let url = URL(string: domainUrlString + "/events")
        
        // Unwrap the url to make sure that it is not null
        guard let unwrappedUrl = url else {
            // TODO: Implelemnt an error
            print("There was an error unwrapping the URL")
            return []
        }
        
        var session = URLSession.shared
        
        let (data, _) = try await session.data(from: unwrappedUrl)
        let decoder = JSONDecoder()
        return try decoder.decode([Event].self, from: data)
    }
    
    func fetchEvents() -> [Event] {
        Task {
            do {
                let fetchedEvents = try await fetchEvents()
                return fetchedEvents
            } catch {
                print(error)
            }
        }
    }*/
}
