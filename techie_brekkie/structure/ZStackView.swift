//
//  ZStackView.swift
//  techie_brekkie
//
//  Created by David Grew on 07/07/2020.
//  Copyright © 2020 David Grew. All rights reserved.
//

import SwiftUI

struct ZStackView: View {
    
    @State var bucketY: CGFloat = 0
    @State var bucketStartY: CGFloat? = nil
    @State var bucketX: CGFloat = 0
    @State var bucketStartX: CGFloat? = nil
    @State var spadeY: CGFloat = 0
    @State var spadeStartY: CGFloat? = nil
    @State var spadeX: CGFloat = 0
    @State var spadeStartX: CGFloat? = nil
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                CodeBox(text: """
                    struct BucketAndSpade: View {

                      var body: some View {

                        ZStack {

                          Image("Bucket")
                            .offset(x: \(String(format: "%.3f", self.bucketX)), y: \(String(format: "%.3f", self.bucketY))
                        
                          Image("Spade")
                            .offset(x: \(String(format: "%.3f", self.spadeX)), y: \(String(format: "%.3f", self.spadeY))

                        }
                      }
                    }
                    """)
                    .frame(width : geometry.size.width * 0.75)
                Image("Spade")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width * 0.2, height: geometry.size.width * 0.2)
                    .offset(x: self.spadeX, y: self.spadeY)
                    .gesture(DragGesture()
                        .onChanged({
                            if self.spadeStartX == nil {
                                self.spadeStartX = self.spadeX
                            }
                            if self.spadeStartY == nil {
                                self.spadeStartY = self.spadeY
                            }
                            self.spadeX = (self.spadeStartX ?? 0) + $0.translation.width
                            self.spadeY = (self.spadeStartY ?? 0) + $0.translation.height
                        })
                        .onEnded({ _ in
                            self.spadeStartX = nil
                            self.spadeStartY = nil
                        }))
                Image("Bucket")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width * 0.2, height: geometry.size.width * 0.2)
                    .offset(x: self.bucketX, y: self.bucketY)
                    .gesture(DragGesture()
                        .onChanged({
                            if self.bucketStartX == nil {
                                self.bucketStartX = self.bucketX
                            }
                            if self.bucketStartY == nil {
                                self.bucketStartY = self.bucketY
                            }
                            self.bucketX = (self.bucketStartX ?? 0) + $0.translation.width
                            self.bucketY = (self.bucketStartY ?? 0) + $0.translation.height
                        })
                        .onEnded({ _ in
                            self.bucketStartX = nil
                            self.bucketStartY = nil
                        }))
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct ZStackView_Previews: PreviewProvider {
    static var previews: some View {
        ZStackView()
    }
}
