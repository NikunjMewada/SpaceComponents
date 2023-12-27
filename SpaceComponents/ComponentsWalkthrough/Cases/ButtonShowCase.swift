//
//  ButtonShowCase.swift
//  SpaceComponents
//
//  Created by Nikunj Mewada on 27/12/23.
//

import SwiftUI

struct ButtonShowCase: View {
    var body: some View {
        VStack {
            Text("Buttons, when clicked, offer a pressed animation. Similar to text components, buttons are available in both static and animated states, providing versatility in design.")
                .setSpaceText()
                .padding(.bottom, 20)
            
            SpaceButtonView(fillColors: SpaceShades.BlueShade, title: "Regular Button", shouldAnimate: false, shouldAnimateBackwards: false) {}
                .frame(height: 100)
                .padding(.bottom, 20)
            
            SpaceButtonView(fillColors: SpaceShades.BlueShade, title: "Animated Button ->", shouldAnimate: true, shouldAnimateBackwards: false) {}
                .frame(height: 100)
                .padding(.bottom, 20)
            
            SpaceButtonView(fillColors: SpaceShades.BlueShade, title: "Backwards Animated Button \n <-", shouldAnimate: true, shouldAnimateBackwards: true) {}
                .frame(height: 100)
                .padding(.bottom, 20)
            
            SpaceButtonView(fillColors: SpaceShades.AllShades, title: "Finish", shouldAnimate: true, shouldAnimateBackwards: false) {
                WalkthroughManager.shared.publisher.send(.ThankYou)
            }
            .frame(height: 100)
        }
    }
}
