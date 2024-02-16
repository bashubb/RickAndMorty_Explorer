//
//  CharacterViewModel.swift
//  RickAndMorty_Explorer
//
//  Created by HubertMac on 15/02/2024.
//

import Foundation

class CharacterModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var isLoading = false
    @Published var showAlert = false
    @Published var errorMessage: String?
    
    init() {

    }
    
    @MainActor
    func fetchCharacters() async {
        let apiService = APIService(urlString:"https://rickandmortyapi.com/api/character")
        isLoading.toggle()
        defer {
            isLoading.toggle()
        }
        do {
            let resultsData: CharacterResponse = try await apiService.getJSON()
            self.characters += resultsData.results
        } catch {
            showAlert = true
            errorMessage = error.localizedDescription + "\nPlease contact the developer and provide this error and the steps to reproduce."
        }
    }
    
    static func trimEpisodeName(_ episodeURL: String) -> String {
        let trimmedName = episodeURL.components(separatedBy: "/").last ?? ""
        return trimmedName
    }
}
