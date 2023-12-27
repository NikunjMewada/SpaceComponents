//
//  ButtonCorners.swift
//  SpaceComponents
//
//  Created by Nikunj Mewada on 25/12/23.
//

import SwiftUI

struct ButtonCorners: View {
    var body: some View {
        Circle()
            .fill(Color.black)
            .frame(width: 15, height: 15)
            .overlay {
                Circle()
                    .fill(Color.white)
                    .frame(width: 10, height: 10)
            }
    }
}
