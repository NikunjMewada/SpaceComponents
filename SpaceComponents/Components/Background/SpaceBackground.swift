//
//  SpaceBackground.swift
//  SpaceComponents
//
//  Created by Nikunj Mewada on 25/12/23.
//

// Source: https://github.com/iAmVishal16/legendary-Animo/blob/main/legendary-Animo/Animations/StarsBlinkView.swift

import SwiftUI

struct SpaceBackgroundView: View {

    @State private var stars: [StarProperties] = []
    @State private var animationTimer: Timer!
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let randomFrame = CGFloat.random(in: 0...10)
                
                ForEach(stars) { star in
                    Star()
                        .fill(Color.mint)
                        .frame(width: randomFrame, height: randomFrame)
                        .scaleEffect(star.scale)
                        .opacity(star.opacity)
                        .position(star.position)
                        .hueRotation(star.hue)
                        .blur(radius: star.opacity)
                        .animation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true))
                }
            }
            .background(Color.black)
            .onAppear {
                startAnimatingStars(in: geometry.size)
            }
            .onDisappear {
                animationTimer?.invalidate()
            }
        }
    }
    
    private func startAnimatingStars(in size: CGSize) {
        animationTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            let randomX = CGFloat.random(in: 0...size.width)
            let randomY = CGFloat.random(in: 0...size.height)
            let randomHue = Angle(degrees: Double(CGFloat.random(in: 0...360)))
            
            let newStar = StarProperties(position: CGPoint(x: randomX, y: randomY))
            stars.append(newStar)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                if let index = stars.firstIndex(where: { $0.id == newStar.id }) {
                    stars[index].scale = 2.0
                    stars[index].opacity = 0.0
                    stars[index].hue = randomHue
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                stars.removeAll(where: {$0.id == newStar.id })
            }
        }
    }
    
}
