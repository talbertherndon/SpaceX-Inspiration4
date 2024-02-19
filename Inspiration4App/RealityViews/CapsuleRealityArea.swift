//
//  CapsuleRealityArea.swift
//  Inspiration4App
//
//  Created by Talbert Andre Herndon on 2/17/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct CapsuleRealityArea: View {
    @Environment(ViewModel.self) private var model
    let attachmentId = "attachmentId"
    @State private var capsule: Entity?

    var body: some View {
        RealityView { content, attachments in
            guard let entity = try? await Entity(named: "Capsule", in: realityKitContentBundle) else {
                fatalError("Unable to load scene model")
            }
            content.add(entity)
            self.capsule = entity
            self.capsule?.components.set(OrbitComponent(radius:0.05, speed:0, angle:0, addOrientationRotation: true))
            
            if let sceneAttachment = attachments.entity(for: attachmentId){
                sceneAttachment.position = SIMD3<Float>(-0.2,-0.1,0.1)
                sceneAttachment.transform.rotation = simd_quatf(angle: -0.5, axis: [1,0,0])
                content.add(sceneAttachment)
            }
        } update: { content, attachments in
            print("RealityView changed detechted...")
        } placeholder: {
            ProgressView()
                .progressViewStyle(.circular)
                .controlSize(.large)
        } attachments: {
            Attachment(id: attachmentId) {
                CapsuleDetails(){
                    self.capsule?.setSunlight(intensity:13)
                } turnOffLight: {
                    self.capsule?.setSunlight(intensity: 6)
                } turnOrbitOn: {
                    self.capsule?.components[OrbitComponent.self]?.speed = 1
                } turnOrbitOff: {
                    self.capsule?.components[OrbitComponent.self]?.speed = 0

                }
            }
        }
        .onDisappear{
            model.isShowingRocketCapsule = false
            
        }
    }
}

#Preview {
    CapsuleRealityArea()
        .environment(ViewModel())
}
