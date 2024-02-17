//
//  CustomCardView.swift
//  RickAndMorty_Explorer
//
//  Created by HubertMac on 17/02/2024.
//

import Foundation
import SwiftUI

struct CustomCardView: View {

    var characterModel: CharacterModel
    var character: Character
    var geoproxy: GeometryProxy
    
    var body: some View {
        ZStack(alignment:.bottom) {
            AsyncImage(url: URL(string: character.image)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            HStack(spacing: 15) {
                Spacer()
                Text(character.name)
                    .font(.headline)
                    .foregroundStyle(.black)
                    .multilineTextAlignment(.leading)
                Spacer()
                Image(systemName: characterModel.isInFavorites(
                    characterID: character.id) ? "heart.fill" : "heart")
                .foregroundStyle(
                    characterModel.isInFavorites(characterID: character.id) ? .red : .clear)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(.gray.opacity(0.3))
            .background(.ultraThinMaterial)
            
        }
        .frame(width: 0.7 * geoproxy.size.width, height: 0.7 * geoproxy.size.width)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color:.gray, radius: 0.5, x: -3, y: 3)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray.opacity(0.8), lineWidth: 2)
        )
        
    }
}
