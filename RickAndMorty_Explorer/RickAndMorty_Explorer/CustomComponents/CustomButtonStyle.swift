//
//  CustomButtonStyle.swift
//  RickAndMorty_Explorer
//
//  Created by HubertMac on 16/02/2024.
//

import Foundation
import SwiftUI

struct FirstCustomButton: ButtonStyle {
    
    let image: String
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            if configuration.isPressed {
                Capsule()
                    .stroke(.blue, lineWidth: 2)
                    .frame(height: 50)
            } else {
                Capsule()
                    .fill(.blue)
                    .frame(height: 50)
            }
            HStack {
                configuration.label
                    .font(.system(size: 30, weight: .medium, design: .rounded))
                Image(systemName: image)
                    .font(.largeTitle)
                    .rotationEffect(Angle(degrees: -90.0))
            }
            .foregroundColor(configuration.isPressed ? Color.blue : Color.white )
        }
        .scaleEffect(configuration.isPressed ? 0.8 : 1)
        .animation(.default.speed(2), value: configuration.isPressed)
    }
}



