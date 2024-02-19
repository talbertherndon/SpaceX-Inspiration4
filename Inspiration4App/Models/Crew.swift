//
//  Crew.swift
//  Inspiration4App
//
//  Created by Talbert Andre Herndon on 2/17/24.
//

import Foundation

enum Crew : String, Identifiable, CaseIterable, Equatable
{
    case jared, hayley, chris, sian
    var id : Self {self}
    var name: String  {rawValue.lowercased()}
    var fullname : String {
        switch self {
        case.jared:
            "Jared Isaacman"
        case.hayley:
            "Hayley Arceneaux"
        case.chris:
            "Chris Sembroski"
        case.sian:
            "Dr. Sian Proctor"
        }
    }
    
    var about : String {
        switch self {
        case.jared:
            "Jared Isaacman is the founder and CEO of Shift4 Payments (NYSE: FOUR), the leader in integrated payment processing solutions. He started the company in 1999 from the basement of his family’s house when he was only 16 years old and has built it into an industry-leading payments technology company with over 1,200 employees."
        case.hayley:
            "When Hayley was 10 years old, one of her knees began to ache. Her doctor thought it was just a sprain, but a few months later, tests revealed Hayley suffered from osteosarcoma, a type of bone cancer. "
        case.chris:
            "Chris Sembroski grew up with a natural curiosity about outer space. Stargazing late at night on the roof of his high school and launching high-powered model rockets in college cemented this passion."
        case.sian:
            "Dr. Sian Proctor is a geoscientist, explorer, and science communication specialist with a lifelong passion for space exploration. She was born in Guam while her father was working at the NASA tracking station during the Apollo missions and has carried on his dedication and interest in space. "
        }
    }
}
