//
//  CapsuleDetails.swift
//  Inspiration4App
//
//  Created by Talbert Andre Herndon on 2/18/24.
//

import SwiftUI

struct CapsuleDetails: View {
    @State private var orbitOn = false
    @State private var lightOn = false
    @State private var isShowing = false
    
    let turnOnLight: ()-> Void
    let turnOffLight: ()-> Void
    
    let turnOrbitOn: ()-> Void
    let turnOrbitOff: ()-> Void
    
    var body: some View {
        VStack {
            Button {
                isShowing.toggle()
            } label: {
                Label("Rocket Options", systemImage:"gear")
            }
            .controlSize(.mini)
            .font(.system(size:10))
        }
        
        if isShowing {
            VStack{
                Text("The Dragon spacecraft is capable of carrying up to 7 passengers to and from Earth orbit, and beyond. It is the only spacecraft currently flying that is capable of returning significant amounts of cargo to Earth, and is the first private spacecraft to take humans to the space station.")
                    .font(.system(size: 8))
                
                HStack(alignment: .top){
                    VStack(alignment: .leading){
                        Toggle(isOn: $lightOn){
                            Text("Light \(!lightOn ? "Off":"On")")
                                .font(.system(size: 8,weight: .bold))
                                .onChange(of: lightOn, {
                                    if lightOn {
                                        turnOnLight()
                                    }
                                    else {
                                        turnOffLight()
                                    }
                                })
                            
                        }
                    }
                    
                    VStack(alignment: .leading){
                        Toggle(isOn: $orbitOn){
                            Text("Light \(!orbitOn ? "Off":"On")")
                                .font(.system(size: 8,weight: .bold))
                                .onChange(of: orbitOn, {
                                    if orbitOn {
                                        turnOrbitOn()
                                    }
                                    else {
                                        turnOrbitOff()
                                    }
                                })
                            
                        }
                    }
                }
            }
            .padding(EdgeInsets(top: 5, leading: 25, bottom: 0, trailing: 25))
            .frame(width: 300,height: 120)
            .glassBackgroundEffect()
        }
    }
}
