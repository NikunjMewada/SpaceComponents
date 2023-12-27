//
//  SpaceButtonView.swift
//  SpaceComponents
//
//  Created by Nikunj Mewada on 25/12/23.
//

import SwiftUI

struct SpaceButtonView: View {
    @State var fillColors: [Color]
    let title: String
    let animationTime = 0.3
    let shouldAnimate: Bool
    let shouldAnimateBackwards: Bool
    let action: () -> Void
    
    @State private var offSet = CGPoint(x: 0, y: 0)
    @State private var didTap = false
    @State private var rotationTimer: Timer!
    
    var body: some View {
        GeometryReader { geometry in
            Text(title)
                .setSpaceText()
                .offset(x: offSet.x, y: offSet.y)
                .overlay {
                    ButtonBorderView(animationTime: animationTime, gradients: $fillColors, didTap: $didTap)
                        .offset(x: offSet.x, y: offSet.y)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onTapGesture {
                    didTap.toggle()
                    UIImpactFeedbackGenerator(style: .soft).impactOccurred()
                    DispatchQueue.main.asyncAfter(deadline: .now() + animationTime + animationTime) {
                        action()
                    }
                }
                .onChange(of: didTap) { newValue in
                    withAnimation {
                        offSet.x = 20
                        offSet.y = 20
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + animationTime) {
                        withAnimation {
                            offSet.x = 0
                            offSet.y = 0
                        }
                    }
                }
                .onAppear {
                    if shouldAnimate {
                        rotateColors()
                    }
                }
                .onDisappear {
                    rotationTimer?.invalidate()
                }
        }
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

struct SpaceButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SpaceButtonView(fillColors: SpaceShades.BlueShade,
                        title: "Example Example Example Example Example Example",
                        shouldAnimate: false,
                        shouldAnimateBackwards: false) {}
            .background(Color.black)
    }
}
