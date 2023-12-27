//
//  TextViewShowCase.swift
//  SpaceComponents
//
//  Created by Nikunj Mewada on 27/12/23.
//

import SwiftUI

struct TextViewShowCase: View {
    @State private var showSimpleTexts = false
    @State private var showAnimatedSimpleTexts = false
    @State private var showAnimatedTexts = false
    @State private var showNextPageButton = false
    let nextViewWaitTime = 3.0
    let titleText = "TextViews are basic text elements with fixed fonts and colors. Easily customize them by adding gradient border on either side of the text."
    let gradientText = "Animate gradient border for dynamic effects like left-to-right or reverse animations, enhancing the visual appeal of your text components."
    
    
    var body: some View {
        VStack {
            SpaceTextTypeView(text: titleText) {
                withAnimation {
                    showSimpleTexts = true
                }
            }
            .padding(.bottom)
            
            if showSimpleTexts {
                SpaceTextView(title: "Left Gradient Border", colors: SpaceShades.BlueShade, shouldAnimate: false, shouldAnimateBackwards: false, gradientFill: .leftHalf)
                    .padding(.bottom)
                
                SpaceTextView(title: "Right Gradient Border", colors: SpaceShades.RedShade, shouldAnimate: false, shouldAnimateBackwards: false, gradientFill: .rightHalf)
                    .padding(.bottom)
            }
            
            if showAnimatedSimpleTexts {
                SpaceTextTypeView(text: gradientText) {
                    withAnimation {
                        showAnimatedTexts = true
                    }
                }
                .padding(.bottom)
                
                if showAnimatedTexts {
                    SpaceTextView(title: "Animated Gradient Border", colors: SpaceShades.GreenShade, shouldAnimate: true, shouldAnimateBackwards: false, gradientFill: .leftHalf)
                        .padding(.bottom)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + nextViewWaitTime) {
                                withAnimation {
                                    showNextPageButton = true
                                }
                            }
                        }
                    
                    if showNextPageButton {
                        SpaceButtonView(fillColors: SpaceShades.AllShades, title: "Now Explore Buttons!", shouldAnimate: true, shouldAnimateBackwards: false) {
                            WalkthroughManager.shared.publisher.send(.Buttons)
                        }
                    }
                }
            }
        }
        .onChange(of: showSimpleTexts) { newValue in
            DispatchQueue.main.asyncAfter(deadline: .now() + nextViewWaitTime) {
                showAnimatedSimpleTexts = true
            }
        }
    }
}
