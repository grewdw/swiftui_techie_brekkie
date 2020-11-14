//
//  HStackView.swift
//  techie_brekkie
//
//  Created by David Grew on 07/07/2020.
//  Copyright © 2020 David Grew. All rights reserved.
//

import SwiftUI

struct HStackView: View {
    @State var leftSpacer: Bool = false
    @State var middleSpacer: Bool = false
    @State var rightSpacer: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    CodeBox(text: """
                        struct PalmTrees: View {

                          var body: some View {

                            HStack {
                              \(self.leftSpacer ? "\n      Spacer()\n" : "")
                              Image("PalmTree1")
                              \(self.middleSpacer ? "\n      Spacer()\n" : "")
                              Image("PalmTree2")
                              \(self.rightSpacer ? "\n      Spacer()" : "")
                            }
                          }
                        }
                        """)
                    Spacer()
                }
                Spacer()
                
                HStack(spacing: 0) {
                    SpacerButton(spacerActive: self.$leftSpacer)
                    if self.leftSpacer {
                        Spacer()
                    }
                    Image("PalmTree1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.25)
                    if self.middleSpacer {
                        Spacer()
                    }
                    SpacerButton(spacerActive: self.$middleSpacer)
                    if self.middleSpacer {
                        Spacer()
                    }
                    Image("PalmTree2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.25)
                    if self.rightSpacer {
                        Spacer()
                    }
                    SpacerButton(spacerActive: self.$rightSpacer)
                }
                Spacer()
            }
        }
    }
}

struct HStackView_Previews: PreviewProvider {
    static var previews: some View {
        HStackView()
    }
}
