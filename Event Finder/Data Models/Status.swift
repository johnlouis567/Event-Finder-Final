//
//  Status.swift
//  Event Finder
//
//  Created by John Ingram on 4/26/23.
//

import Foundation
struct Status : Codable {
    let code : String?

    enum CodingKeys: String, CodingKey {

        case code = "code"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(String.self, forKey: .code)
    }

}
