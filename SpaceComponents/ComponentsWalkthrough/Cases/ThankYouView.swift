//
//  ThankYouView.swift
//  SpaceComponents
//
//  Created by Nikunj Mewada on 27/12/23.
//

import SwiftUI

struct ThankYouView: View {
    @Environment(\.openURL)
    private var openURL
    
    @State private var showRepoButton = false
    
    var body: some View {
        VStack {
            SpaceTextTypeView(text: "Thank You!,\n Please feel free to use these components and\n\n Give a review 🌟") {
                withAnimation {
                    showRepoButton = true
                }
            }
            
            if showRepoButton {
                SpaceButtonView(fillColors: SpaceShades.AllShades, title: "Checkout Github Repo", shouldAnimate: true, shouldAnimateBackwards: false) {
                    // Open Github in Safari
                    openURL(URL(string: "https://github.com/NikunjMewada/SpaceComponents")!)
                }
                .frame(height: 100)
            }
        }
    }
}
