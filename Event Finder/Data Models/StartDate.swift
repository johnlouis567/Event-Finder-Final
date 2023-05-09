//
//  StartDate.swift
//  Event Finder
//
//  Created by John Ingram on 4/16/23.
//

import Foundation

struct StartDate: Codable, Hashable {
    let localDate : String?
    let dateTBD : Bool?
    let dateTBA : Bool?
    let timeTBA : Bool?
    let noSpecificTime : Bool?

    enum CodingKeys: String, CodingKey {

        case localDate = "localDate"
        case dateTBD = "dateTBD"
        case dateTBA = "dateTBA"
        case timeTBA = "timeTBA"
        case noSpecificTime = "noSpecificTime"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        localDate = try values.decodeIfPresent(String.self, forKey: .localDate)
        dateTBD = try values.decodeIfPresent(Bool.self, forKey: .dateTBD)
        dateTBA = try values.decodeIfPresent(Bool.self, forKey: .dateTBA)
        timeTBA = try values.decodeIfPresent(Bool.self, forKey: .timeTBA)
        noSpecificTime = try values.decodeIfPresent(Bool.self, forKey: .noSpecificTime)
    }
}
