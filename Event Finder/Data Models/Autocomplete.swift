//
//  Autocomplete.swift
//  Event Finder
//
//  Created by John Ingram on 5/5/23.
//

import Combine
import Foundation

@MainActor
final class AutocompleteObject: ObservableObject {

    let delay: TimeInterval = 0.3

    @Published var suggestions: [String] = []

    init() {
    }

    private let citiesCache = CitiesCache(source: CitiesFile()!)

    private var task: Task<Void, Never>?

    func autocomplete(_ text: String) {
        guard !text.isEmpty else {
            suggestions = []
            task?.cancel()
            return
        }

        task?.cancel()

        task = Task {
//            await Task.sleep(UInt64(delay * 1_000_000_000.0))
            do {
                try await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000.0))
            } catch {
                print("There was an error with the sleep Task")
            }
            
            guard !Task.isCancelled else {
                return
            }

            let newSuggestions = await citiesCache.lookup(prefix: text)

            if isSingleSuggestion(suggestions, equalTo: text) {
                // Do not offer only one suggestion same as the input
                suggestions = []
            } else {
                suggestions = newSuggestions
            }
        }
    }

    private func isSingleSuggestion(_ suggestions: [String], equalTo text: String) -> Bool {
        guard let suggestion = suggestions.first, suggestions.count == 1 else {
            return false
        }

        return suggestion.lowercased() == text.lowercased()
    }
}
