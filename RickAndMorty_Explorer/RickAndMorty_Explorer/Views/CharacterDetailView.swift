//
//  CharacterDetailView.swift
//  RickAndMorty_Explorer
//
//  Created by HubertMac on 15/02/2024.
//

import SwiftUI

struct CharacterDetailView: View {
    @State private var isInFavorites = false
    var characterModel: CharacterModel
    var character: Character
    
    
    var body: some View {
        List {
            Button {
                characterModel.toggleInFavorites(characterID: character.id)
                isInFavorites = characterModel.isInFavorites(characterID: character.id)
            } label: {
                Text(isInFavorites ?
                     "Usuń z ulubionych" : "Dodaj do ulubionych" )
            }
            
            Section("name") {
                Text(character.name)
            }
            Section("status") {
                Text(character.status)
            }
            Section("gender") {
                Text(character.gender)
            }
            Section("origin") {
                Text(character.origin.name)
                Text(character.origin.url)
//                Link("Idź do strony", destination: URL(string: character.origin.url)!)
//                    .buttonStyle(.bordered)
            }
            Section("location") {
                Text(character.location.name)
                Text(character.location.url)
//                Link("Idź do strony", destination: URL(string: character.location.url)!)
//                    .buttonStyle(.bordered)
            }
            Section("image") {
                AsyncImage(url: URL(string: character.image))
            }

            Section("Episodes") {
                ForEach(character.episode, id: \.self) { episodeURL in
                    NavigationLink {
                        EpisodeDetailView(episodeURL: episodeURL)
                    } label: {
                        Text("Odcinek \(CharacterModel.trimEpisodeName(episodeURL))")
                    }
                    
                }
            }
        }
        .onAppear{
            isInFavorites = characterModel.isInFavorites(characterID: character.id)
        }
        .navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}


