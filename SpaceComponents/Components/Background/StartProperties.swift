//
//  StartProperties.swift
//  SpaceComponents
//
//  Created by Nikunj Mewada on 25/12/23.
//

import SwiftUI

struct StarProperties: Identifiable {
    let id = UUID()
    let position: CGPoint
    var scale: CGFloat = 1.0
    var opacity: Double = 1.0
    var hue: Angle = .zero
}
