//
//  MissionArea.swift
//  Inspiration4App
//
//  Created by Talbert Andre Herndon on 2/17/24.
//

import SwiftUI
import AVKit

struct MissionArea: View {
    
    @State var player = AVPlayer(url: Bundle.main.url(forResource: "Inspiration4", withExtension:"mp4")!)
    @State var isPlaying: Bool = false
    
    
    var body: some View {
        VStack {
            VideoPlayer(player: player)
            Button {
                isPlaying ? player.pause(): player.play()
                isPlaying.toggle()
                player.seek(to: .zero)
                
            } label: {
                Image(systemName:isPlaying ? "stop":"play")
                    .padding(5)
            }
            .padding(10)
        }
        .glassBackgroundEffect()
        .onAppear(perform: {
            isPlaying = false
        })
        .onDisappear(perform: {
            player.pause()
        })
    }
}

#Preview {
    MissionArea()
        .environment(ViewModel())
}
