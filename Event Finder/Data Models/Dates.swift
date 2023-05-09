//
//  Dates.swift
//  Event Finder
//
//  Created by John Ingram on 4/16/23.
//

import Foundation

struct Dates : Codable {
    let start : StartDate?
    let timezone : String?
    let status : Status?
    let spanMultipleDays : Bool?

    enum CodingKeys: String, CodingKey {

        case start = "start"
        case timezone = "timezone"
        case status = "status"
        case spanMultipleDays = "spanMultipleDays"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        start = try values.decodeIfPresent(StartDate.self, forKey: .start)
        timezone = try values.decodeIfPresent(String.self, forKey: .timezone)
        status = try values.decodeIfPresent(Status.self, forKey: .status)
        spanMultipleDays = try values.decodeIfPresent(Bool.self, forKey: .spanMultipleDays)
    }

}
