//
//  CrewArea.swift
//  Inspiration4App
//
//  Created by Talbert Andre Herndon on 2/17/24.
//

import SwiftUI

struct CrewArea: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        HStack {
            ForEach(Crew.allCases) { crew in
                VStack(alignment: .leading) {
                    Image("crew-\(crew.name)")
                        .resizable()
                        .frame(width: 180,height: 200)
                    Text(crew.fullname)
                        .font(.system(size: 32, weight: .bold))
                    Text(crew.about)
                        .font(.system(size: 20))
                }
                .frame(minWidth:180,minHeight: 200)
                .padding(15)
                .glassBackgroundEffect()
                
                
            }
        }
    }
}

#Preview {
    CrewArea()
}
