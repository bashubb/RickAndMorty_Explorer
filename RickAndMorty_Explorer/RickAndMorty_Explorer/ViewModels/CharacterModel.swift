//
//  CharacterViewModel.swift
//  RickAndMorty_Explorer
//
//  Created by HubertMac on 15/02/2024.
//

import Foundation
import SwiftUI

class CharacterModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var isLoading = false
    @Published var showAlert = false
    @Published var errorMessage: String?
    @Published var favoriteCharacters: [Int] = [] {
        didSet {
            if let encoded = try? JSONEncoder().encode(favoriteCharacters) {
                UserDefaults.standard.set(encoded, forKey: "favoriteCharacters")
            }
        }
    }
    
    var urlStringCharacters = "https://rickandmortyapi.com/api/character"
    
    init() {
        loadFavoriteCharacters()
    }
    
    @MainActor
    func fetchCharacters() async {
        let apiService = APIService(urlString: urlStringCharacters)
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
    
    func loadFavoriteCharacters() {
        if let savedItems = UserDefaults.standard.data(forKey: "favoriteCharacters") {
            if let decodedItems = try? JSONDecoder().decode([Int].self, from: savedItems) {
                favoriteCharacters = decodedItems
                return
            }
        }
        favoriteCharacters = []
    }
    
    
    func isInFavorites(characterID: Int) -> Bool {
        withAnimation {
            favoriteCharacters.contains(where: { $0 == characterID })
        }
    }
    
    func toggleInFavorites(characterID: Int) {
        withAnimation {
            if isInFavorites(characterID: characterID){
                let index = favoriteCharacters.firstIndex(where: { $0 == characterID })
                favoriteCharacters.remove(at: index!)
            } else {
                favoriteCharacters.append(characterID)
            }
        }
    }
    
    func sortByFavorites(array: [Character]) -> [Character] {
        let sortedCharacters = array.sorted(by: { (item1: Character, item2: Character) -> Bool in
            if favoriteCharacters.contains(where: { $0 == item1.id }) {
                return true
            } else if favoriteCharacters.contains(where: { $0 == item2.id}) {
                return false
            }
            return item1 < item2
        })
        
        return sortedCharacters
    }
    
    static func trimEpisodeName(_ episodeURL: String) -> String {
        let trimmedName = episodeURL.components(separatedBy: "/").last ?? ""
        return trimmedName
    }
}
