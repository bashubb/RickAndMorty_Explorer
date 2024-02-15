//
//  Episode.swift
//  RickAndMorty_Explorer
//
//  Created by HubertMac on 15/02/2024.
//

import Foundation

struct Episode: Codable, Identifiable {
    var id: Int
    var name: String
    var airDate: String
    var episode: String
    var characters: [String]
}
