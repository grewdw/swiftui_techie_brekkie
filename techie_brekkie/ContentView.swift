//
//  ContentView.swift
//  techie_brekkie
//
//  Created by David Grew on 03/07/2020.
//  Copyright © 2020 David Grew. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showIntro: Bool = true
    @State private var showOutro: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                NavigationView {
                    List {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(height: 100)
                        
                        link("Intro")
                            .onTapGesture {
                                withAnimation(.easeIn) {
                                    self.showIntro.toggle()
                                }
                        }
                        
                        link("")
                        
                        Section(header: section("What is SwiftUI?"), footer: Text("")) {
                            NavigationLink(destination: EmptyView()) {
                                link("Declarative UI framework")
                            }
                            NavigationLink(destination: EmptyView()) {
                                link("Cross Platform")
                            }
                            
                        }
                        
                        Section(header: section("Features"), footer: Text("")) {
                            NavigationLink(destination: EmptyView()) {
                                link("Overview")
                            }
                            
                            NavigationLink(destination: Structure()) {
                                link("Structure & Positioning")
                            }
                            
                            NavigationLink(destination: Modifiers()) {
                                link("Modifiers")
                            }
                            
                            NavigationLink(destination: StateView()) {
                                link("State")
                            }
                            
                            NavigationLink(destination: Animation()) {
                                link("Animation")
                            }
                        }
                        
                        link("")
                        
                        link("Outro")
                            .onTapGesture {
                                withAnimation(.easeIn(duration: 0.5)) {
                                    self.showOutro.toggle()
                                }
                        }
                    }
                    .frame(width: 400)
                }
                .zIndex(0)
                
                if self.showIntro {
                    Intro(visible: self.$showIntro)
                        .transition(.move(edge: .leading))
                        .zIndex(3)
                }
                
                if self.showOutro {
                    Outro(visible: self.$showOutro)
                        .transition(.opacity)
                        .zIndex(1)
                }
                
                Logo(name: "Logo")
                    .scaleEffect(self.showOutro ? 2 : 1)
                    .offset(x: self.getLogoX(width: geometry.size.width),
                            y: self.getLogoY(height: geometry.size.height))
                
                Logo(name: "SwiftLogo")
                    .scaleEffect(self.showOutro ? 2 : 1)
                    .offset(x: self.getSwiftLogoX(width: geometry.size.width),
                            y: self.getSwiftLogoY(height: geometry.size.height))
                
                Text("SwiftUI")
                    .font(.system(size: 56, weight: .heavy, design: Font.Design.default))
                    .foregroundColor(Color.white)
                    .scaleEffect(self.showIntro || self.showOutro ? 3 : 1)
                    .frame(width: self.getTitleWidth(width: geometry.size.width),
                           height: self.getTitleHeight(),
                           alignment: .center)
                    .offset(x: self.getTitleX(width: geometry.size.width),
                            y: self.getTitleY(height: geometry.size.height))
                    .zIndex(4)
            }
            .transition(.move(edge: .top))
        }
    }
    
    private func getLogoX(width: CGFloat) -> CGFloat {
        return self.showOutro ? width * -0.45 + 140 : -(width / 2 - 85)
    }
    
    private func getLogoY(height: CGFloat) -> CGFloat {
        return self.showOutro ? height * -0.45 + 140 : height / 2 - 85
    }
    
    private func getSwiftLogoX(width: CGFloat) -> CGFloat {
        return self.showOutro ? width * 0.45 - 140 : width / 2 - 85
    }
    
    private func getSwiftLogoY(height: CGFloat) -> CGFloat {
        return self.showOutro ? height * 0.45 - 140 : -(height / 2 - 85)
    }
    
    private func getTitleX(width: CGFloat) -> CGFloat {
        if self.showIntro {
            return 0
        } else if self.showOutro {
            return width * 0.45 - 350
        } else {
            return -(width / 2 - 200)
        }
    }
    
    private func getTitleY(height: CGFloat) -> CGFloat {
        if self.showIntro || self.showOutro {
            return height * -0.45 + 140
        } else {
            return -(height / 2 - 45)
        }
    }
    
    private func getTitleWidth(width: CGFloat) -> CGFloat {
        if self.showIntro || self.showOutro {
            return 600
        }
        return 360
    }
    
    private func getTitleHeight() -> CGFloat {
        if self.showOutro || self.showOutro {
            return 240
        }
        return 50
    }
}

struct Logo: View {
    var name: String
    
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 120, maxHeight: 120)
            .zIndex(2)
    }
}

func section(_ text: String) -> Text {
    return Text(text).font(.headline)
}

func link(_ text: String) -> Text {
    return Text(text).font(.title)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
