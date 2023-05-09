//
//  CitiesCache.swift
//  Event Finder
//
//  Created by John Ingram on 5/5/23.
//

import Foundation

protocol CitiesSource {

    func loadCities() -> [String]
}

/// The `CitiesCache` object manages the list of city names loaded from an external source.
actor CitiesCache {

    /// Source to load city names.
    let source: CitiesSource

    init(source: CitiesSource) {
        self.source = source
    }

    /// The list of city names.
    var cities: [String] {
        if let cities = cachedCities {
            return cities
        }

        let cities = source.loadCities()
        cachedCities = cities

        return cities
    }

    private var cachedCities: [String]?
}

extension CitiesCache {
    func lookup(prefix: String) -> [String] {
        cities.filter { $0.hasCaseAndDiacriticInsensitivePrefix(prefix) }
    }
}
