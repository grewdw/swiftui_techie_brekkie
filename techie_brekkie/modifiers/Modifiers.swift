//
//  Modifiers.swift.swift
//  techie_brekkie
//
//  Created by David Grew on 03/07/2020.
//  Copyright © 2020 David Grew. All rights reserved.
//

import SwiftUI

struct Modifiers: View {
    
    @State private var font: Bool = false
    @State private var color: Bool = false
    @State private var frame: Bool = false
    @State private var background: Bool = false
    @State private var backgroundBefore: Bool = false
    @State private var border: Bool = false
    @State private var cornerRadius: Bool = false
    @State private var shadow: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    HStack {
                        Text("Modifiers")
                            .font(.system(size: 56, weight: .heavy, design: Font.Design.default))
                        Spacer()
                    }
                    Spacer()
                }
                .padding(20)
                
                Spacer()
                
                HStack {
                    VStack(alignment: .leading) {
                        Spacer()
                        
                        HStack {
                            Text("Text(\"To be Modified...\")").font(.title)
                            Spacer()
                            Text(" ")
                        }
                        
                        VStack(alignment: .leading) {
                            ModifierToggle(toggleText: "Font",
                                           active: self.$font,
                                           explanationText: "    .font(Font.system(.title, design: .monospaced)")
                            
                            ModifierToggle(toggleText: "Color",
                                           active: self.$color,
                                           explanationText: "    .foregroundColor(Color.white)")
                            
                            if self.backgroundBefore {
                                ModifierToggle(toggleText: "Background",
                                               active: self.$background,
                                               explanationText: "    .background(Rectangle().foregroundColor(.blue)")
                            }
                            
                            ModifierToggle(toggleText: "Frame",
                                           active: self.$frame,
                                           explanationText: "    .frame(width: 500, height: 500)")
                            
                            if !self.backgroundBefore {
                                ModifierToggle(toggleText: "Background",
                                               active: self.$background,
                                               explanationText: "    .background(Rectangle().foregroundColor(.blue)")
                            }
                            
                            ModifierToggle(toggleText: "Border",
                                           active: self.$border,
                                           explanationText: "    .border(.red, width: 2)")
                            
                            ModifierToggle(toggleText: "Corner Radius",
                                           active: self.$cornerRadius,
                                           explanationText: "    .cornerRadius(100)")
                            
                            ModifierToggle(toggleText: "Shadow",
                                           active: self.$shadow,
                                           explanationText: "    .shadow(radius: 50)")
                        }
                        
                        Spacer()
                        
                        HStack {
                            Spacer()
                            Button(action: { self.backgroundBefore.toggle() }) {
                                Text(self.backgroundBefore ? "Frame -> Background" : "Background -> Frame")
                                    .font(.headline)
                                    .foregroundColor(.blue)
                            }.buttonStyle(PlainButtonStyle())
                            Spacer()
                        }
                        
                        Spacer()
                    }
                    .padding()
                    .frame(width: geometry.size.width * 0.6, height: geometry.size.height)
                    
                    Spacer()
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                        
                        Text("To be modified...")
                            .font(self.font ? Font.system(.title, design: .monospaced) : .body)
                            .foregroundColor(self.color ? Color.white : Color.black)
                            .background(self.backgroundBefore ? AnyView(RoundedRectangle(cornerRadius: 0).foregroundColor(self.background ? Color.blue : Color.white)) : AnyView(EmptyView()))
                            .frame(width: self.frame ? 500 : 150, height: self.frame ? 500 : 30)
                            .background(!self.backgroundBefore ? AnyView(RoundedRectangle(cornerRadius: 0).foregroundColor(self.background ? Color.blue : Color.white)) : AnyView(EmptyView()))
                            .border(Color.red, width: self.border ? 2 : 0)
                            .cornerRadius(self.cornerRadius ? 100 : 0)
                            .shadow(radius: self.shadow ? 50 : 0)
                    }
                    .frame(width: geometry.size.width * 0.4, height: geometry.size.height)
                }
                
                Spacer()
            }
        }
    }
}

struct ModifierToggle: View {
    
    var toggleText: String
    @Binding var active: Bool
    var explanationText: String
    
    var body: some View {
        HStack {
            Text(self.active ? explanationText : " ").font(.title)
            Spacer()
            Toggle(isOn: $active, label: { Text(toggleText).font(.title) })
            .toggleStyle(SwitchToggleStyle())
        }
        .frame(height: 50)
    }
}

struct Modifiers_Previews: PreviewProvider {
    static var previews: some View {
        Modifiers()
    }
}
