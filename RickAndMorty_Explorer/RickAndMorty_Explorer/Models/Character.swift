//
//  CharacterModel.swift
//  RickAndMorty_Explorer
//
//  Created by HubertMac on 15/02/2024.
//

import Foundation

struct Character: Codable, Identifiable {
    var id: Int
    var name: String
    var status: String
    var gender: String
    var origin: Origin
    var location: Location
    var image: String
    var epizode: [String]
}


struct Origin: Codable {
    var name: String
    var url: String
}

struct Location: Codable {
    var name: String
    var url: String
}
