//
//  FullRocketRealityArea.swift
//  Inspiration4App
//
//  Created by Talbert Andre Herndon on 2/17/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct FullRocketRealityArea: View {
    @State private var audioController: AudioPlaybackController?
    
    var body: some View {
        RealityView { content in
            guard let entity = try? await Entity(named:"Immersive", in: realityKitContentBundle) else {
                fatalError("Unable to load immersive model")
            }
            
            let ambientAudioEntity = entity.findEntity(named: "AmbientAudio")
            
            guard let resource = try? await AudioFileResource(named: "/Root/Space_wav", from: "Immersive.usda", in: realityKitContentBundle) else {
                fatalError("Unable to load space.wav audio resource")
            }
            ambientAudioEntity?.ambientAudio?.gain = -30;
            audioController = ambientAudioEntity?.prepareAudio(resource)
            audioController?.play()
            
            content.add(entity)
        }
        .onDisappear(perform: {
            audioController?.stop()
        })
    }
}

#Preview {
    FullRocketRealityArea()
}
