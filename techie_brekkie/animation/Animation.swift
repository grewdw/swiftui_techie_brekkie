//
//  Animation.swift
//  techie_brekkie
//
//  Created by David Grew on 03/07/2020.
//  Copyright © 2020 David Grew. All rights reserved.
//

import SwiftUI

struct Animation: View {
    
    @ObservedObject private var state: AnimationState = AnimationState()
        
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    HStack {
                        Text("Animation")
                            .font(.system(size: 56, weight: .heavy, design: Font.Design.default))
                            .foregroundColor(Color.white)
                            .scaleEffect(self.state.stage == .INITIAL ? 3 : 1)
                            .frame(width: 280, height: 60, alignment: .topLeading)
                            .offset(x: self.state.stage == .INITIAL ? geometry.size.width / 2 - 160 : 0,
                                    y: self.state.stage == .INITIAL ? geometry.size.height / 2 - 50 : 0)
                            .onTapGesture {
                                self.state.restart()
                        }
                        Spacer()
                    }
                    Spacer()
                }
                .padding(20)
                
                HStack {
                    Spacer()
                    Rectangle()
                        .foregroundColor(.black)
                        .frame(width: geometry.size.width * (CGFloat(self.state.hiddenPercent) / 10))
                }
                
                VStack {
                    Text("Animations smooth the transitions that are required when a modifier is updated by a change in state")
                        .foregroundColor(.white)
                    Button(action: {
                        withAnimation(.linear(duration: 1)) {
                            self.state.stopTimer()
                            self.state.stage = .ENDTIMER
                        }
                    }) {
                        Text("Show Me!")
                    }
                }
                .offset(x: self.state.stage == .SETUP ? -(geometry.size.width * 0.25) : -geometry.size.width)
                
                Sun(state: self.state)
                    .frame(width: geometry.size.width / 2, height: geometry.size.height)
                    .offset(x: self.state.stage == .SETUP ? geometry.size.width * 0.25 : geometry.size.width)
                
                Windmill(state: self.state)
                    .frame(width: geometry.size.width / 2, height: geometry.size.height)
                    .offset(x: self.state.stage == .SETUP ? geometry.size.width * 0.25 : self.state.stage == .ENDTIMER ? 0 : geometry.size.width)
                
                HStack {
                    AnimationButton(text: "self.state.windmillRotation += 315")
                        .onTapGesture {
                            self.state.windmillRotation += 315
                    }
                    Spacer()
                    VStack(alignment: .trailing, spacing: 20) {
                        AnimationButton(text: "withAnimation(.linear(duration: 1) { \n     self.state.windmillRotation += 315 \n }")
                            .onTapGesture {
                                withAnimation(.linear(duration: 1)) {
                                    self.state.windmillRotation += 315
                                }
                            }
                        AnimationButton(text: "withAnimation(.easeIn(duration: 1) { \n     self.state.windmillRotation += 315 \n }")
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 1)) {
                                self.state.windmillRotation += 315
                            }
                        }
                        AnimationButton(text: "withAnimation(.easeOut(duration: 1) { \n     self.state.windmillRotation += 315 \n }")
                        .onTapGesture {
                            withAnimation(.easeOut(duration: 1)) {
                                self.state.windmillRotation += 315
                            }
                        }
                        AnimationButton(text: "withAnimation(.spring()) { \n     self.state.windmillRotation += 315 \n }")
                        .onTapGesture {
                            withAnimation(.spring()) {
                                self.state.windmillRotation += 315
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .offset(y: self.state.stage == .ENDTIMER ? 0 : geometry.size.height)
            }
            .onAppear(perform: { self.state.startTimer() })
        }
    }
}

struct AnimationButton: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.gray))
            .shadow(radius: 10)
    }
}

struct Animation_Previews: PreviewProvider {
    static var previews: some View {
        Animation()
    }
}
