//
//  EquipmentCard.swift
//  Inspiration4App
//
//  Created by Talbert Andre Herndon on 2/17/24.
//

import SwiftUI

struct EquipmentCard: View {
    @Binding var isShowing: Bool
    let toggleTitle: String
    let imageName: String
    let openCard: () async -> Void
    let dismissCard: () async -> Void
    
    var body: some View {
        VStack{
            Image(imageName)
                .resizable()
                .frame(width: 300,height: 300)
                .padding(20)
            Toggle(isShowing ? "Hide \(toggleTitle)": "Show \(toggleTitle)", isOn: $isShowing)
                .onChange(of: isShowing, initial: false) { isShowing, initial in
                    Task {
                        if !isShowing{
                            await openCard()
                        } else {
                            await dismissCard()
                        }
                    }
                }
                .toggleStyle(.button)
                .padding(25)
            
        }
        .glassBackgroundEffect()
    }
}

