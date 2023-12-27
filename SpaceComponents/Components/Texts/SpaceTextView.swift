//
//  SpaceTextView.swift
//  SpaceComponents
//
//  Created by Nikunj Mewada on 27/12/23.
//

import SwiftUI

enum GradientFill {
    case leftHalf // Covers 50% Gradient in Left of Text
    case rightHalf // Covers 50% Gradient in Right of Text
}

struct SpaceTextView: View {
    let title: String
    let colors: [Color]
    let shouldAnimate: Bool
    let shouldAnimateBackwards: Bool
    let gradientFill: GradientFill
    
    @State private var fillColors: [Color] = []
    @State private var rotationTimer: Timer!
    
    var body: some View {
        Text(title)
            .setSpaceText()
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: fillColors),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 3
                    )
                
            }
            .onAppear {
                setFillColors()
                if shouldAnimate {
                    rotateColors()
                }
            }
            .onDisappear {
                rotationTimer?.invalidate()
            }
    }
    
    private func setFillColors() {
        fillColors.append(contentsOf: colors)
        
        let clearColorArray = Array(repeating: Color.clear, count: colors.count)
        fillColors.insert(contentsOf: clearColorArray, at: gradientFill == .leftHalf ? fillColors.count : 0)
    }
    
    private func rotateColors() {
        rotationTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { timer in
            if shouldAnimateBackwards {
                let first = fillColors.first ?? .clear
                withAnimation {
                    fillColors.removeFirst()
                    fillColors.insert(first, at: fillColors.count)
                }
            } else {
                let last = fillColors.last ?? .clear
                withAnimation {
                    fillColors.removeLast()
                    fillColors.insert(last, at: 0)
                }
            }
        })
    }
}

struct SpaceTextView_Previews: PreviewProvider {
    static var previews: some View {
        SpaceTextView(title: "Space Title",
                      colors: SpaceShades.GreenShade,
                      shouldAnimate: false,
                      shouldAnimateBackwards: false,
                      gradientFill: .leftHalf)
        .background(Color.black)
    }
}
