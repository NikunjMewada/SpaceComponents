//
//  SpaceTextTypeView.swift
//  SpaceComponents
//
//  Created by Nikunj Mewada on 27/12/23.
//

import SwiftUI

struct SpaceTextTypeView: View {
    let text: String
    let animationFinished: () -> Void
    @State private var animatedText: String = ""
    
    var body: some View {
        Text(animatedText)
            .setSpaceText()
            .multilineTextAlignment(.center)
            .padding([.leading, .trailing], 10)
            .task { await animateText() }
//            .frame(width: .infinity)
    }
    
    private func animateText() async {
        for character in text {
            animatedText.append(character)
            await UIImpactFeedbackGenerator(style: .light).impactOccurred()
            try! await Task.sleep(for: .milliseconds(75))
        }
        
        animationFinished()
    }
}

struct SpaceTextTypeView_Previews: PreviewProvider {
    static var previews: some View {
        SpaceTextTypeView(text: "Space TypeWriter Animation") {}
    }
}
