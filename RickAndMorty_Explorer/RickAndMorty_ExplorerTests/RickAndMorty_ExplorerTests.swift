//
//  RickAndMorty_ExplorerTests.swift
//  RickAndMorty_ExplorerTests
//
//  Created by HubertMac on 17/02/2024.
//

import XCTest

@testable import RickAndMorty_Explorer

class CharacterModelTests: XCTestCase {
    
    var characterModel: CharacterModel!
    override func setUp() {
        
        characterModel = CharacterModel()
    }
    
    override func tearDown() {
        characterModel = nil
    
    }
    
    
    func testIsInFavorites() {
        // Given
        characterModel.favoriteCharacters = [1, 2, 3]
        
        // When
        let isInFavorites = characterModel.isInFavorites(characterID: 2)
        
        // Then
        XCTAssertTrue(isInFavorites, "Character with ID 2 should be in favorites")
    }
    
    func testToggleInFavorites() {
        // Given
        characterModel.favoriteCharacters = [1, 3]
        
        // When
        characterModel.toggleInFavorites(characterID: 2)
        
        // Then
        XCTAssertTrue(characterModel.favoriteCharacters.contains(2), "Character with ID 2 should be added to favorites")
        
        // When
        characterModel.toggleInFavorites(characterID: 1)
        
        // Then
        XCTAssertFalse(characterModel.favoriteCharacters.contains(1), "Character with ID 1 should be removed from favorites")
    }
    
    func testSortByFavorites() {
        // Given
        let characters: [Character] = [
            Character(id: 1, name: "Character 1", status: "", species: "", type: "", gender: "", origin: Origin(name: "", url: ""), location: Location(name: "", url: ""), image: "", episode: [], url: "", created: ""),
            Character(id: 2, name: "Character 2", status: "", species: "", type: "", gender: "", origin: Origin(name: "", url: ""), location: Location(name: "", url: ""), image: "", episode: [], url: "", created: ""),
            Character(id: 3, name: "Character 3", status: "", species: "", type: "", gender: "", origin: Origin(name: "", url: ""), location: Location(name: "", url: ""), image: "", episode: [], url: "", created: "")
        ]
        characterModel.favoriteCharacters = [2, 3]
        
        // When
        let sortedCharacters = characterModel.sortByFavorites(array: characters)
        
        // Then
        XCTAssertEqual(sortedCharacters.map { $0.id }, [3, 2, 1], "Characters should be sorted by favorites")
    }
    
    func testSortByName() {
        // Given
        let characters: [Character] = [
            Character(id: 1, name: "C", status: "", species: "", type: "", gender: "", origin: Origin(name: "", url: ""), location: Location(name: "", url: ""), image: "", episode: [], url: "", created: ""),
            Character(id: 2, name: "A", status: "", species: "", type: "", gender: "", origin: Origin(name: "", url: ""), location: Location(name: "", url: ""), image: "", episode: [], url: "", created: ""),
            Character(id: 3, name: "B", status: "", species: "", type: "", gender: "", origin: Origin(name: "", url: ""), location: Location(name: "", url: ""), image: "", episode: [], url: "", created: "")
        ]
        
        // When
        let sortedCharacters = characterModel.sortByName(array: characters)
        
        // Then
        XCTAssertEqual(sortedCharacters.map { $0.name }, ["A", "B", "C"], "Characters should be sorted by name")
    }

    func testSortByPopular() {
        // Given
        let characters: [Character] = [
            Character(id: 1, name: "", status: "", species: "", type: "", gender: "", origin: Origin(name: "", url: ""), location: Location(name: "", url: ""), image: "", episode: ["1", "2"], url: "", created: ""),
            Character(id: 2, name: "", status: "", species: "", type: "", gender: "", origin: Origin(name: "", url: ""), location: Location(name: "", url: ""), image: "", episode: ["1"], url: "", created: ""),
            Character(id: 3, name: "", status: "", species: "", type: "", gender: "", origin: Origin(name: "", url: ""), location: Location(name: "", url: ""), image: "", episode: ["1", "3", "2"], url: "", created: "")
        ]
        
        // When
        let sortedCharacters = characterModel.sortByPopular(array: characters)
        
        // Then
        XCTAssertEqual(sortedCharacters.map { $0.id }, [3, 1, 2], "Characters should be sorted by popularity (number of episodes)")
    }

    
    func testTrimEpisodeName() {
        // Given
        let episodeURL = "https://rickandmortyapi.com/api/episode/123"
        
        // When
        let trimmedName = CharacterModel.trimEpisodeName(episodeURL)
        
        // Then
        XCTAssertEqual(trimmedName, "123", "Episode name should be trimmed correctly")
    }
}
