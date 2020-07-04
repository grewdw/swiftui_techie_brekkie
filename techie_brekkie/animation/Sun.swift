//
//  Sun.swift
//  techie_brekkie
//
//  Created by David Grew on 03/07/2020.
//  Copyright © 2020 David Grew. All rights reserved.
//

import SwiftUI

struct Sun: View {
    
    @ObservedObject var state: AnimationState
    
    var x: [CGFloat] = [-0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6]
    var y: [CGFloat] = [-0.2, -0.25, -0.3, -0.35, -0.3, -0.25, -0.2]
    var color: [Color] = [.clear, .red, .orange, .yellow, .orange, .red, .clear]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.blue
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                
                ZStack {
                    ForEach(0...6, id: \.self) { i in
                        Rectangle()
                            .foregroundColor(self.color[self.state.sunStage])
                            .frame(width: self.getRayWidth(), height: min(geometry.size.width, geometry.size.height) * self.getRayLengthMultiplier())
                            .rotationEffect(Angle(degrees: Double(30 * i)))
                    }
                    Circle()
                        .foregroundColor(self.color[self.state.sunStage])
                        .frame(width: min(geometry.size.width, geometry.size.height) * 0.15, height: min(geometry.size.width, geometry.size.height) * 0.15)
                    
                }
                .offset(x: geometry.size.width * self.x[self.state.sunStage], y: geometry.size.height * self.y[self.state.sunStage])
            }
        }
    }
    
    func getRayWidth() -> CGFloat {
        if state.sunStage == 0 || state.sunStage == 6 {
            return 0
        } else if state.sunStage == 1 || state.sunStage == 5 {
            return 1
        } else if state.sunStage == 3 {
            return 3
        }
        return 2
    }
    
    func getRayLengthMultiplier() -> CGFloat {
        if state.sunStage == 0 || state.sunStage == 6 {
            return 0
        }
        return state.sunStage % 2 == 0 ? 0.2 : 0.35
    }
}

struct Sun_Previews: PreviewProvider {
    static var previews: some View {
        Sun(state: AnimationState())
    }
}
