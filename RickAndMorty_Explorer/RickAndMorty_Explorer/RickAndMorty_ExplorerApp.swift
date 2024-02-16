//
//  RickAndMorty_ExplorerApp.swift
//  RickAndMorty_Explorer
//
//  Created by HubertMac on 15/02/2024.
//

import SwiftUI

@main
struct RickAndMorty_ExplorerApp: App {
    
    init() {
        var titleFont = UIFont.preferredFont(forTextStyle: .largeTitle) /// the default large title font
        titleFont = UIFont(
            descriptor:
                titleFont.fontDescriptor
                .withDesign(.rounded)? /// make rounded
                .withSymbolicTraits(.traitBold)/// make bold
            ??
            titleFont.fontDescriptor, /// return the normal title if customization failed
            size: titleFont.pointSize
        )
        
        var compactFont = UIFont.preferredFont(forTextStyle: .headline) /// the default large title font
        compactFont = UIFont(
            descriptor:
                compactFont.fontDescriptor
                .withDesign(.rounded)? /// make rounded
                .withSymbolicTraits(.traitBold) /// make bold
            ??
            compactFont.fontDescriptor, /// return the normal title if customization failed
            size: compactFont.pointSize
        )
        
        
        /// set the rounded font
        UINavigationBar.appearance().largeTitleTextAttributes = [.font: titleFont]
        UINavigationBar.appearance().compactAppearance?.titleTextAttributes = [.font: compactFont]
        
    }
    
    var body: some Scene {
        
        WindowGroup {
            CharacterListView()
        }
    }
}
