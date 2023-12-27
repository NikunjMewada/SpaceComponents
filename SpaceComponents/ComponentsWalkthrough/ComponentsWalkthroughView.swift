//
//  ComponentsWalkthroughView.swift
//  SpaceComponents
//
//  Created by Nikunj Mewada on 27/12/23.
//

import SwiftUI

struct ComponentsWalkthroughView: View {
    @State private var walkthroughOrder: WalkthroughOrder = .Entry
    
    var body: some View {
        ZStack {
            SpaceBackgroundView()
            
            Group {
                switch walkthroughOrder {
                case .Entry:
                    EntryView()
                case .Text:
                    TextViewShowCase()
                case .Buttons:
                    ButtonShowCase()
                case .ThankYou:
                    ThankYouView()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onReceive(WalkthroughManager.shared.publisher) { screen in
            walkthroughOrder = screen
        }
    }
    
}

struct ComponentsWalkthroughView_Previews: PreviewProvider {
    static var previews: some View {
        ComponentsWalkthroughView()
    }
}
