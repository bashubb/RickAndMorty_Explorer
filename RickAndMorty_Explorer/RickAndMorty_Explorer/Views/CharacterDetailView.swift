//
//  CharacterDetailView.swift
//  RickAndMorty_Explorer
//
//  Created by HubertMac on 15/02/2024.
//

import SwiftUI

struct CharacterDetailView: View {
    var character: Character
    
    
    
    var body: some View {
        List {
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
            }
            Section("location") {
                Text(character.location.name)
                Text(character.location.url)
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
    }
}


