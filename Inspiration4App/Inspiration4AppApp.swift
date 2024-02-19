//
//  Inspiration4AppApp.swift
//  Inspiration4App
//
//  Created by Talbert Andre Herndon on 2/17/24.
//

import SwiftUI

@main
struct Inspiration4App: App {
    @State private var model = ViewModel()
    
    var body: some Scene {
        WindowGroup("Main Areas", id: "Areas") {
            Areas()
                .environment(model)
        }
        
        WindowGroup(id: model.capsuleRealityAreaId) {
            CapsuleRealityArea()
                .environment(model)
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 0.65, height: 0.3, depth: 0.3, in: .meters)
        
        ImmersiveSpace(id: model.fullRocketRealityAreaId){
            FullRocketRealityArea()
                .environment(model)
        }
        .immersionStyle(selection: .constant(.full), in: .full)
        
        ImmersiveSpace(id: model.mixedRocketRealityAreaId){
            FullRocketRealityArea()
                .environment(model)
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed)
    }
    
    init() {
        OrbitComponent.registerComponent()
        OrbitSystem.registerSystem()
        
    }
}
