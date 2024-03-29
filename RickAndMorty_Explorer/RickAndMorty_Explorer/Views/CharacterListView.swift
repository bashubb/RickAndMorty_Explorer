//
//  ContentView.swift
//  RickAndMorty_Explorer
//
//  Created by HubertMac on 15/02/2024.
//

import SwiftUI

struct CharacterListView: View {
    
    @StateObject var characterModel = CharacterModel()
    @State private var isListLoaded = false
    
    var body: some View {
        GeometryReader { gp in
            HStack(spacing:0) {
                WelcomeView(characterModel: characterModel, isListLoaded: isListLoaded)
                NavigationView {
                    listOfCharacters
                        .navigationTitle("Postacie")
                        .toolbar {
                            ToolbarItem(placement: .topBarLeading) {
                                resetButton
                            }
                            ToolbarItem(placement: .topBarTrailing) {
                                sortButton
                            }
                        }
                        .font(.system(size:17, weight:.regular,design:.rounded))
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
                        isListLoaded = false
                    } else {
                        isListLoaded = true
                    }
                }
            }
            .frame(width: gp.size.width * 2)
            .offset(x: isListLoaded ?  -gp.size.width : 0)
            .animation(.interpolatingSpring(mass: 0.6, stiffness: 50, damping: 7).speed(1.5).delay(0.5),value: isListLoaded)
            
        }
    }
    
    ///View components
    @ViewBuilder var listOfCharacters: some View {
        GeometryReader { geo in
            ScrollView(showsIndicators: false) {
                ForEach(characterModel.characters) { character in
                    NavigationLink{
                        CharacterDetailView(characterModel: characterModel, character: character)
                    } label : {
                        CustomCardView(characterModel: characterModel, character: character, geoproxy: geo)
                            .padding()
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
        .background(.ultraThickMaterial)
    }
    
    var resetButton: some View {
        Button {
            characterModel.characters.removeAll()
        } label : {
            HStack {
                Image(systemName: "chevron.left")
                Text("Powrót")
            }
        }
    }
    
    var sortButton: some View {
        Menu("Sortuj") {
            Button("sortuj alfabetycznie") {
                withAnimation {
                    characterModel.characters = characterModel.sortByName(array: characterModel.characters)
                }
            }
            Button("sortuj wg popularnosci") {
                withAnimation {
                    characterModel.characters = characterModel.sortByPopular(array: characterModel.characters)
                }
            }
            Button("sortuj wg ulubionych"){
                withAnimation {
                    characterModel.characters = characterModel.sortByFavorites(array: characterModel.characters)
                }
            }
            Button("domyślna kolejność" ) {
                withAnimation {
                    characterModel.characters = characterModel.characters.sorted()
                }
            }
        }
    }
    
}


/// Welcome View
struct WelcomeView: View {
    
    var characterModel: CharacterModel
    var isListLoaded: Bool
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                
                titleImage
                
                Spacer()
                
                openingText
                
                Spacer()
                
                loadingButton
                
                Spacer()
            }
            .ignoresSafeArea()
            .padding(30)
        }
        .background(.ultraThinMaterial)
    }
    
    ///View components
    @ViewBuilder var titleImage: some View {
        Text("Rick and Morty")
            .frame(maxWidth:.infinity, alignment: .topLeading)
            .font(.system(size: 40, weight: .bold, design: .rounded))
            .animation(.interpolatingSpring(stiffness: 50, damping: 7).speed(2), value: isListLoaded)
            .padding(.bottom, 20)
        Image("RickAndMorty")
            .resizable()
            .scaledToFit()
            .animation(.interpolatingSpring(stiffness: 50, damping: 7).speed(2).delay(0.1), value: isListLoaded)
    }
    
    var openingText: some View {
        VStack(spacing: 30) {
            Text("Przy pomocy tej aplikacji możesz poznać bohaterów serialu Rick and Morty!")
            Text("Twoja lista jest teraz pusta. Dotknij przycisk \"Zaczynajmy\" aby pobrać listę bohaterów.")
                .font(.callout)
        }
        .font(.system(size: 20, weight: .regular, design: .rounded))
        .animation(.interpolatingSpring(stiffness: 50, damping: 7).speed(2).delay(0.2), value: isListLoaded)
    }
    
    var loadingButton: some View {
        Button("Zaczynajmy") {
            Task {
                await characterModel.fetchCharacters()
            }
        }
        .buttonStyle(FirstCustomButton(image:"arrow.down.circle.dotted"))
        .animation(.interpolatingSpring(stiffness: 50, damping: 7).speed(2).delay(0.3), value: isListLoaded)
        
    }
}


#Preview {
    CharacterListView()
}


