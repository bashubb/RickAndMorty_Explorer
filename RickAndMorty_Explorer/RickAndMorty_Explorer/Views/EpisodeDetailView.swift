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
            Section("Tytuł") {
                Text(episodeModel.episode?.name ?? "")
            }
            
            Section("Data publikacji") {
                Text(episodeModel.episode?.airDate ?? "")
            }
            
            Section("Numer odcinka") {
                Text(episodeModel.episode?.episode ?? "")
            }
            
            Section("Liczba Bohaterów w odcinku") {
                Text("\(episodeModel.episode?.characters.count ?? 0) ")
            }
        }
        .task {
            await episodeModel.fetchEpisode(url: episodeURL)
        }
        .navigationTitle(episodeModel.episode?.name ?? "")
        .navigationBarTitleDisplayMode(.inline)
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


