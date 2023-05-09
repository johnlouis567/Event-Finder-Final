//
//  EventSummary.swift
//  Event Finder
//
//  Created by John Ingram on 4/10/23.
//

import Foundation

struct EventSummary: Codable {
    let id: String
    var name: String // Ex: "BEYONC\u00c9 - RENAISSANCE WORLD TOUR"
    var type: String // Ex: "event"
    var test: Bool
    var url: String
    var locale: String // Ex: "en-us"
    // TODO: Implement "images"
    // TODO: Implement "sales"
    // TODO: Implement "dates"
    // TODO: Implement "classifications"
    // TODO: Implement "promoter"
    // TODO: Implement "priceRanges"
    // TODO: Implement "seatmap"
    // TODO: Implement "ageRestrictions"
    // TODO: Implement "_links"
    // TODO: Implement "_embedded"
}
