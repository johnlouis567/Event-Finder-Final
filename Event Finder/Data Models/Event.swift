//
//  Event.swift
//  Event Finder
//
//  Created by John Ingram on 4/10/23.
//

import Foundation

struct Event: Identifiable, Codable {
    
    let id: String
    var name: String // Ex: "BEYONC\u00c9 - RENAISSANCE WORLD TOUR"
    var type: String // Ex: "event"
    var test: Bool
    var url: String
    var locale: String // Ex: "en-us"
    var images: [MyImage]
    var priceRanges: [PriceRange]?
    var dates: Dates?
    
    // Two Events are the same event if the id is the same
    static func == (lhs: Event, rhs: Event) -> Bool {
        return lhs.id == rhs.id
    }
        
}
