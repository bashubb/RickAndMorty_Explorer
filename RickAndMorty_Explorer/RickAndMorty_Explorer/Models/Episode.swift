//
//  Episode.swift
//  RickAndMorty_Explorer
//
//  Created by HubertMac on 15/02/2024.
//

import Foundation

struct Episode: Codable, Identifiable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
