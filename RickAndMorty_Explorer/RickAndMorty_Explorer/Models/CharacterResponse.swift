//
//  CharacterModel.swift
//  RickAndMorty_Explorer
//
//  Created by HubertMac on 15/02/2024.
//

import Foundation

struct CharacterResponse: Codable {
    let info: Info
    let results: [Character]
}

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct Character: Comparable, Codable, Identifiable  {
    
    var id: Int
    let name: String
    let status: String
    let species: String
    let type: String?
    let gender: String
    let origin: Origin
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
    static func <(lhs: Character, rhs: Character) -> Bool {
        lhs.id < rhs.id
    }
    
    static func == (lhs: Character, rhs: Character) -> Bool {
        lhs.id == rhs.id
    }
}

struct Origin: Codable {
    let name: String
    let url: String
}

struct Location: Codable {
    let name: String
    let url: String
}

  