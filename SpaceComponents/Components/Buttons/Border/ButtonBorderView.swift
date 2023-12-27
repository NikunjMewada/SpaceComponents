//
//  ButtonBorderView.swift
//  SpaceComponents
//
//  Created by Nikunj Mewada on 25/12/23.
//

import SwiftUI

struct ButtonBorderView: View {
    let animationTime: TimeInterval
    private let lineWidth = 3.0
    @State private var offSet = CGPoint(x: 0, y: 0)
    @State private var isAnimating = false
    @Binding var gradients: [Color]
    @Binding var didTap: Bool
    
    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: gradients),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: lineWidth
                )
                .overlay {
                    let rectangleWidth = geometry.size.width
                    let rectangleHeight = geometry.size.height
                    
                    ZStack {
                        drawOuterPath(rectangleWidth: rectangleWidth, rectangleHeight: rectangleHeight)
                            .offset(x: offSet.x, y: offSet.y)
                        
                        makeOuterRectPoints(rectangleWidth: rectangleWidth, rectangleHeight: rectangleHeight)
                            .offset(x: offSet.x, y: offSet.y)
                        
                        makeMainRectPoints(rectangleWidth: rectangleWidth, rectangleHeight: rectangleHeight)
                    }
                    .onChange(of: didTap) { newValue in
                        withAnimation {
                            isAnimating = true
                            offSet.x = -10
                            offSet.y = -10
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + animationTime) {
                            withAnimation {
                                isAnimating = false
                                offSet.x = 0
                                offSet.y = 0
                            }
                        }
                    }
                }
        }
    }
    
    private func makeMainRectPoints(rectangleWidth: CGFloat, rectangleHeight: CGFloat) -> some View {
        ZStack {
            ButtonCorners().offset(x: (-rectangleWidth / 2), y: (-rectangleHeight / 2))// Top Left
            ButtonCorners().offset(x: (rectangleWidth / 2), y: (-rectangleHeight / 2)) // Top Right
            ButtonCorners().offset(x: (-rectangleWidth / 2), y: (rectangleHeight / 2)) // Bottom Left
            ButtonCorners().offset(x: (rectangleWidth / 2), y: (rectangleHeight / 2)) // Bottom Right
        }
    }
    
    private func makeOuterRectPoints(rectangleWidth: CGFloat, rectangleHeight: CGFloat) -> some View {
        ZStack {
            ButtonCorners().offset(x: rectangleWidth / 2 + 20, y: rectangleHeight / 2 + 15).opacity(isAnimating ? 0.3 : 1) // Bottom Right Outside
            ButtonCorners().offset(x: (-rectangleWidth / 2) + 20, y: (rectangleHeight / 2) + 15).opacity(isAnimating ? 0.3 : 1) // Bottom Left Outside
            ButtonCorners().offset(x: rectangleWidth / 2 + 20, y: (-rectangleHeight / 2) + 15).opacity(isAnimating ? 0.3 : 1) // Top Right Outside
        }
    }
    
    private func drawOuterPath(rectangleWidth: CGFloat, rectangleHeight: CGFloat) -> some View {
        ZStack {
            Path { path in
                path.move(to: CGPoint(x: 0, y: rectangleHeight))
                path.addLine(to: CGPoint(x: 20, y: rectangleHeight + 15))
            }
            .stroke(
                LinearGradient(
                    gradient: Gradient(colors: gradients),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ).opacity(isAnimating ? 0 : 1),
                lineWidth: lineWidth
            )
            
            Path { path in
                path.move(to: CGPoint(x: rectangleWidth, y: rectangleHeight))
                path.addLine(to: CGPoint(x: rectangleWidth + 20, y: rectangleHeight + 15))
            }
            .stroke(
                LinearGradient(
                    gradient: Gradient(colors: gradients),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ).opacity(isAnimating ? 0 : 1),
                lineWidth: lineWidth
            )
            
            Path { path in
                path.move(to: CGPoint(x: rectangleWidth, y: 0))
                path.addLine(to: CGPoint(x: rectangleWidth + 20, y: 15))
            }
            .stroke(
                LinearGradient(
                    gradient: Gradient(colors: gradients),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ).opacity(isAnimating ? 0 : 1),
                lineWidth: lineWidth
            )
            
            Path { path in
                path.move(to: CGPoint(x: 20, y: rectangleHeight + 15))
                path.addLine(to: CGPoint(x: rectangleWidth + 20, y: rectangleHeight + 15))
            }
            .stroke(
                LinearGradient(
                    gradient: Gradient(colors: gradients),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ),
                lineWidth: lineWidth
            )
            
            Path { path in
                path.move(to: CGPoint(x: rectangleWidth + 20, y: 15))
                path.addLine(to: CGPoint(x: rectangleWidth + 20, y: rectangleHeight + 15))
            }
            .stroke(
                LinearGradient(
                    gradient: Gradient(colors: gradients),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ),
                lineWidth: lineWidth
            )
        }
    }
}
