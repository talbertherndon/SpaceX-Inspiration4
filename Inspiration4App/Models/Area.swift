//
//  Area.swift
//  Inspiration4App
//
//  Created by Talbert Andre Herndon on 2/17/24.
//

import Foundation

enum Area : String, Identifiable, CaseIterable, Equatable
{
    case astronauts, equipment, mission
    var id : Self {self}
    var name: String {rawValue.lowercased()}
    
    var title : String {
        switch self {
        case.astronauts:
            "Inspiration 4 mission crew members.."
        case.equipment:
            "Inspiration 4 mission crew members.."
        case.mission:
            "Inspirtaion 4 mission trailer..."
        }
    }
}
