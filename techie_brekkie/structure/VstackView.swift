//
//  VstackView.swift
//  techie_brekkie
//
//  Created by David Grew on 07/07/2020.
//  Copyright © 2020 David Grew. All rights reserved.
//

import SwiftUI

struct VstackView: View {
    
    @State var topSpacer: Bool = false
    @State var middleSpacer: Bool = false
    @State var bottomSpacer: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                CodeBox(text: """
                    struct BeachBalls: View {

                      var body: some View {

                        VStack {
                          \(self.topSpacer ? "\n      Spacer()\n" : "")
                          Image("BeachBall1")
                          \(self.middleSpacer ? "\n      Spacer()\n" : "")
                          Image("BeachBall2")
                          \(self.bottomSpacer ? "\n      Spacer()" : "")
                        }
                      }
                    }
                    """)
                HStack {
                    Spacer()
                    VStack(spacing: 0) {
                        SpacerButton(spacerActive: self.$topSpacer)
                        if self.topSpacer {
                            Spacer()
                        }
                        Image("BeachBall1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.height * 0.15, height: geometry.size.height * 0.15)
                        if self.middleSpacer {
                            Spacer()
                        }
                        SpacerButton(spacerActive: self.$middleSpacer)
                        if self.middleSpacer {
                            Spacer()
                        }
                        Image("BeachBall2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.height * 0.15, height: geometry.size.height * 0.15)
                        if self.bottomSpacer {
                            Spacer()
                        }
                        SpacerButton(spacerActive: self.$bottomSpacer)
                    }
                    Spacer()
                }
                .frame(width: geometry.size.width * 0.5)
            }
        }
    }
}

struct SpacerButton: View {
    
    @Binding var spacerActive: Bool
    
    var body: some View {
        Button(action: { withAnimation(.linear) { self.spacerActive.toggle() }}) {
            Text("\(self.spacerActive ? "Remove" : "Add") Spacer")
        }
    }
}

struct VstackView_Previews: PreviewProvider {
    static var previews: some View {
        VstackView()
    }
}
