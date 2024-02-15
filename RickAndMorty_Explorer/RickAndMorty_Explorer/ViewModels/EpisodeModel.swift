//
//  EpisodeModel.swift
//  RickAndMorty_Explorer
//
//  Created by HubertMac on 15/02/2024.
//

import Foundation

class EpisodeModel: ObservableObject {
    @Published var episode: Episode?
    @Published var isLoading = false
    @Published var showAlert = false
    @Published var errorMessage: String?
    
    init() {

    }
    
    @MainActor
    func fetchCharacters(url: String) async {
        let apiService = APIService(urlString: url)
        isLoading.toggle()
        defer {
            isLoading.toggle()
        }
        do {
            let resultsData: Episode = try await apiService.getJSON()
            self.episode = resultsData
        } catch {
            showAlert = true
            errorMessage = error.localizedDescription + "\nPlease contact the developer and provide this error and the steps to reproduce."
        }
    }
}
