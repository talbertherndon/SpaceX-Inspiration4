//
//  EquipmentArea.swift
//  Inspiration4App
//
//  Created by Talbert Andre Herndon on 2/17/24.
//

import SwiftUI

struct EquipmentArea: View {
    @Environment(ViewModel.self) private var model
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    
    var body: some View {
        @Bindable var model = model
        
        HStack {
            EquipmentCard(isShowing: $model.isShowingRocketCapsule, toggleTitle: "Rocket Capsule (Volumetric)", imageName: "equipment-capsule") {
                openWindow(id: model.capsuleRealityAreaId)
            } dismissCard: {
                dismissWindow(id: model.capsuleRealityAreaId)
            }
            
            EquipmentCard(isShowing: $model.isShowingFullRocket, toggleTitle: "Rocket (Full Immersive Space)", imageName: "equipment-fullrocket") {
                await openImmersiveSpace(id: model.fullRocketRealityAreaId)
            } dismissCard: {
                await dismissImmersiveSpace()
            }
            
            EquipmentCard(isShowing: $model.isShowingMixedRocket, toggleTitle: "Rocket (Mixed Immersive Space)", imageName: "equipment-mixedrocket") {
                await openImmersiveSpace(id: model.mixedRocketRealityAreaId)
            } dismissCard: {
                await dismissImmersiveSpace()
            }
        }
    }
}

#Preview {
    EquipmentArea()
        .environment(ViewModel())
}
