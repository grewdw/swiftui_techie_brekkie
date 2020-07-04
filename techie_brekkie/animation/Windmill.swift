//
//  Windmill.swift
//  techie_brekkie
//
//  Created by David Grew on 03/07/2020.
//  Copyright © 2020 David Grew. All rights reserved.
//

import SwiftUI

struct Windmill: View {
    
    @ObservedObject var state: AnimationState
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    Spacer()
                    Image("WindmillTower")
                    .resizable()
                    .scaledToFit()
                        .frame(height: geometry.size.height / 2)
                }

                Image("WindmillWings")
                    .resizable()
                    .scaledToFit()
                    .frame(width: min(geometry.size.height, geometry.size.width) * 0.6,
                           height: min(geometry.size.height, geometry.size.width) * 0.6)
                    .rotationEffect(Angle(degrees: self.state.windmillRotation))
            }
        }
    }
}

struct Windmill_Previews: PreviewProvider {
    static var previews: some View {
        Windmill(state: AnimationState())
    }
}
