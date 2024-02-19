//
//  ViewModel.swift
//  Inspiration4App
//
//  Created by Talbert Andre Herndon on 2/17/24.
//

import Foundation

@Observable
class ViewModel {
    var navigationPath : [Area] = []
    
    var isShowingRocketCapsule : Bool = false
    var isShowingFullRocket : Bool = false
    var isShowingMixedRocket : Bool = false
    
    var capsuleRealityAreaId: String = "CapsuleRealityArea"
    var fullRocketRealityAreaId: String = "FullRocketRealityArea"
    var mixedRocketRealityAreaId: String = "MixedRocketRealityArea"
}
