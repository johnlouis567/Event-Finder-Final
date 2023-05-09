//
//  CitiesFile.swift
//  Event Finder
//
//  Created by John Ingram on 5/5/23.
//

import Foundation

struct CitiesFile: CitiesSource {

    let location: URL

    init(location: URL) {
        self.location = location
    }

    init?() {
        guard let location = Bundle.main.url(forResource: "cities", withExtension: nil) else {
            assertionFailure("cities file is not in the main bundle")
            return nil
        }

        self.init(location: location)
    }

    func loadCities() -> [String] {
//        do {
//            let data = try Data(contentsOf: location)
//            let string = String(data: data, encoding: .utf8)
//            return string?.components(separatedBy: .newlines) ?? []
        print("My Code is getting called")
        let filePath = location.path
        guard let contentData = FileManager.default.contents(atPath: filePath) else {
            print("Could not open up the location cities")
            return []
        }

        guard let contentString = String(data: contentData, encoding: .ascii) else {
            print("The content string was empty")
            return []
        }
        let lines = contentString.components(separatedBy: .newlines)
        print("My code is finishing")
        return lines
//        }
//        catch {
//            return []
//        }
    }
}
