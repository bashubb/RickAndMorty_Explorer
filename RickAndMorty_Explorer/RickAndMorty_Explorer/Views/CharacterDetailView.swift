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
    
    var locationURL: URL {
        if let url = URL(string:character.location.url) {
            return url
        }
        return URL(string:"http://www.google.com/404")!
    }
    
    var originURL: URL {
        if let url = URL(string:character.origin.url) {
            return url
        }
        return URL(string:"http://www.google.com/404")!
    }
    
    
    var body: some View {
        List {
            Section("zdjęcie") {
                AsyncImage(url: URL(string: character.image))
            }
            
            Button {
                characterModel.toggleInFavorites(characterID: character.id)
                isInFavorites = characterModel.isInFavorites(characterID: character.id)
            } label: {
                Text(isInFavorites ?
                     "Usuń z ulubionych" : "Dodaj do ulubionych" )
            }
            
            Section("imię") {
                Text(character.name)
            }
            Section("status") {
                Text(character.status)
            }
            Section("płeć") {
                Text(character.gender)
            }
            Section("pochodzenie") {
                Text(character.origin.name)
                Text(character.origin.url)
                Link("Idź do strony", destination: originURL)
                    .buttonStyle(.bordered)
            }
            Section("lokacja") {
                Text(character.location.name)
                Text(character.location.url)
                Link("Idź do strony", destination: locationURL)
                    .buttonStyle(.bordered)
            }

            Section("Odcinki") {
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

#Preview {
    CharacterListView()
}
