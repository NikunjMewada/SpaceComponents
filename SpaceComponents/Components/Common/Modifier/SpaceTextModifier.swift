//
//  SpaceTextModifier.swift
//  SpaceComponents
//
//  Created by Nikunj Mewada on 27/12/23.
//

import SwiftUI

struct SpaceTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .fontDesign(.monospaced)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .padding(20)
    }
}

extension View {
    func setSpaceText() -> some View {
        modifier(SpaceTextModifier())
    }
}
