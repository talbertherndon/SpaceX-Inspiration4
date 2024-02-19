//
//  Areas.swift
//  Inspiration4App
//
//  Created by Talbert Andre Herndon on 2/17/24.
//

import SwiftUI

struct Areas: View {
    @Environment(ViewModel.self) private var model
    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @Environment(\.dismissWindow) private var dismissWindow
    var body: some View {
        ZStack {
            NavigationStack {
                NavigationToAreas()
            }
        }
        .onChange(of: scenePhase) {_,newScenePhase in
            if (model.isShowingFullRocket || model.isShowingMixedRocket) && newScenePhase == .background {
                Task {
                    await dismissImmersiveSpace()
                }
            }
            if model.isShowingRocketCapsule && newScenePhase == .background {
                dismissWindow(id: model.capsuleRealityAreaId)
            }
        }
    }
}

#Preview {
    Areas()
        .environment(ViewModel())
}
