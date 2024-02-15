//
//  ContentView.swift
//  RickAndMorty_Explorer
//
//  Created by HubertMac on 15/02/2024.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject var characterModel = CharacterModel()
    @State var isListEmpty = true
    
    var body: some View {
        NavigationView {
            if isListEmpty {
                WelcomeView(characterModel: characterModel)
            } else {
                List{
                    ForEach(characterModel.characters) { character in
                        NavigationLink{
                            CharacterDetailView(character: character)
                        } label: {
                            HStack {
                                Button {
                                    
                                } label: {
                                    Image(systemName: "heart")
                                }
                                Text(character.name)
                                    .font(.headline)
                            }
                        }
                    }
                }
                .navigationTitle("Characters")
                .toolbar{
                    Button("reset"){
                        characterModel.characters.removeAll()
                    }
                }
            }
        }
        .overlay {
            if characterModel.isLoading {
                ProgressView()
            }
        }
        .alert("Application Error", isPresented: $characterModel.showAlert){
            Button("OK") {}
        } message: {
            if let errorMessage = characterModel.errorMessage {
                Text(errorMessage)
            }
        }
        .onReceive(characterModel.$characters) { newValue in
            if newValue.isEmpty {
                isListEmpty = true
            } else {
                isListEmpty = false
            }
        }
        
        
    }
}

#Preview {
    CharacterListView()
}

struct WelcomeView: View {
    var characterModel: CharacterModel
    
    var body: some View {
        ZStack {
            Color(hue: 1.0, saturation: 0.0, brightness: 0.948)
                .ignoresSafeArea()
            VStack {
                Text("Marty and Morty Explorer")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.bottom)
                    .background(Color.gray.opacity(0.3))
                
                Spacer()
                
                Text("W tej aplikacji możesz poznać bohaterów serialu Rick and Morty. Twoja lista jest teraz pusta. Kliknij przycisc \"Load\" aby pobrać liste bohaterów")
                    .font(.title3)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.regularMaterial, in: .rect(cornerRadius: 10))
                    .shadow(radius: 4)
                    .padding()
                
                Spacer()
                
                Button {
                    Task {
                        await characterModel.fetchCharacters()
                    }
                } label: {
                    Text("Load")
                        .font(.title)
                        .foregroundStyle(.white)
                        .padding()
                        .frame(width: 120)
                        .background(Color.blue, in: .rect(cornerRadius: 10))
                    
                }
                
                Spacer()
                
            }
        }
    }
}
