//
//  EntryView.swift
//  SpaceComponents
//
//  Created by Nikunj Mewada on 27/12/23.
//

import SwiftUI

struct EntryView: View {
    @State private var introTextAnimationFinished = false

    let entryIntroString = "This walkthrough showcases the components created using SwiftUI. \n\n The First component is TextView.  This component features a distinctive border and displays text content. It's a simple yet a visually appealing element. \n\n The Second component is Cube Button. The Cube Button is interactive and animates upon a click event. \n\n Both the TextView and Cube Button components can be animated when needed, enhancing the user experience"
    
    var body: some View {
        VStack(alignment: .center) {
            SpaceTextView(title: "Welcome to Space Components", colors: SpaceShades.BlueShade, shouldAnimate: false, shouldAnimateBackwards: false, gradientFill: .rightHalf)
                .padding(.top, 40)
            
            Spacer()
            
            SpaceTextTypeView(text: entryIntroString) {
                withAnimation {
                    introTextAnimationFinished = true
                }
            }
            
            Spacer()
            
            if introTextAnimationFinished {
                SpaceButtonView(fillColors: SpaceShades.RedShade, title: "Click To Proceed ->", shouldAnimate: false, shouldAnimateBackwards: false) {
                    WalkthroughManager.shared.publisher.send(.Text)
                }
                .frame(height: 150)
            }
        }
    }
}
