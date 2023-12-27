//
//  WalkthroughOrder.swift
//  SpaceComponents
//
//  Created by Nikunj Mewada on 27/12/23.
//

import Foundation
import Combine

enum WalkthroughOrder {
    case Entry
    case Text
    case Buttons
    case ThankYou
}

final class WalkthroughManager {
    static let shared = WalkthroughManager()
    let publisher = PassthroughSubject<WalkthroughOrder, Never>()
}
