//
//  priceRange.swift
//  Event Finder
//
//  Created by John Ingram on 4/16/23.
//

import Foundation

struct PriceRange: Codable {
    var min: Double?
    var max: Double?
    
    // Change to functions that return string instead of calculated values
    var minString: String {
        if let determinedPrice = min {
            return String(determinedPrice)
        }
        return ""
    }
    var maxString: String {
        if let determinedPrice = max {
            return String(determinedPrice)
        }
        return ""
    }
    
    // This specifies to only look for min and max in the json
    private enum CodingKeys: String, CodingKey {
        case min = "min"
        case max = "max"
    }
}
