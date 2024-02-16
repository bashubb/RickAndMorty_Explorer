//
//  EpisodeDetailView.swift
//  RickAndMorty_Explorer
//
//  Created by HubertMac on 15/02/2024.
//

import SwiftUI

struct EpisodeDetailView: View {
    @StateObject var episodeModel = EpisodeModel()
    var episodeURL: String
    
    var body: some View {
        Form {
            Section("name") {
                Text(episodeModel.episode?.name ?? "")
            }
            
            Section("air date") {
                Text(episodeModel.episode?.airDate ?? "")
            }
            
            Section("Episode") {
                Text(episodeModel.episode?.episode ?? "")
            }
            
            Section("Liczba Bohaterów") {
                Text("\(episodeModel.episode?.characters.count ?? 0) ")
            }
        }
        .task {
            await episodeModel.fetchEpisode(url: episodeURL)
        }
        .alert("Application Error", isPresented: $episodeModel.showAlert){
            Button("OK") {}
        } message: {
            if let errorMessage = episodeModel.errorMessage {
                Text(errorMessage)
            }
        }
        .overlay {
            if episodeModel.isLoading {
                ProgressView()
            }
        }
    }
    
    
}

//#Preview {
//    EpisodeDetailView()
//}
