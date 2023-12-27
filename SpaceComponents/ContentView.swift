//
//  ContentView.swift
//  SpaceComponents
//
//  Created by Nikunj Mewada on 25/12/23.
//

import SwiftUI

enum SpaceShades {
    static let AllShades: [Color] = [.purple, .indigo, .blue, .green, .yellow, .orange, .red]
    static let BlueShade: [Color] = [.cyan, .blue, .indigo, .purple]
    static let RedShade: [Color] = [.orange, .red, .pink]
    static let GreenShade: [Color] = [.teal, .mint, .green]
}

struct ContentView: View {
    
    var body: some View {
        ZStack(alignment: .center) {
            SpaceBackgroundView()
            
            VStack(alignment: .center) {
                SpaceTextView(title: "Welcome", colors: SpaceShades.GreenShade, shouldAnimate: false, shouldAnimateBackwards: false, gradientFill: .rightHalf)
                    .padding(.bottom)
                
                SpaceTextView(title: "To Space", colors: SpaceShades.BlueShade, shouldAnimate: true, shouldAnimateBackwards: true, gradientFill: .leftHalf)
                    .padding(.bottom)
                
                SpaceButtonView(fillColors: SpaceShades.RedShade, title: "Red Dwarf", shouldAnimate: false, shouldAnimateBackwards: false) {
                    debugPrint("Tap Button Action")
                }
                .frame(height: 150)
                
                SpaceButtonView(fillColors: SpaceShades.BlueShade, title: "Blue Nebula", shouldAnimate: false, shouldAnimateBackwards: false) {
                    debugPrint("Tap Button Action")
                }
                .frame(height: 150)

                SpaceButtonView(fillColors: SpaceShades.AllShades, title: "Natural Aura", shouldAnimate: false, shouldAnimateBackwards: false) {
                    debugPrint("Tap Button Action")
                }
                .frame(height: 150)
            }
            
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
