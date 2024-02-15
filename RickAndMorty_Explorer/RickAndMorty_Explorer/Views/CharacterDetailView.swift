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
        Form {
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
                Text(character.location.name)
                Text(character.location.url)
            }
            Section("location") {
                Text(character.name)
            }
            Section("name") {
                Text(character.name)
            }
        }
    }
}


