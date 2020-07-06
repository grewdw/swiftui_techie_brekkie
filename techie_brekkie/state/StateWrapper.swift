//
//  StateWrapper.swift
//  techie_brekkie
//
//  Created by David Grew on 06/07/2020.
//  Copyright © 2020 David Grew. All rights reserved.
//

import SwiftUI

struct StateWrapper: View {
    
    let holidayDestinations: [String] = ["Paris", "Barcelona", "Berlin", "Lisbon", "Edinburgh"]
    
    @State var selection: String = "Paris"
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    
                    CodeBox(text: """
                        struct Destination: View {

                          var holidayDestinations = [...]

                          @State var selection: String = \(self.selection)

                          var body: some View {
                        
                            VStack {
                        
                              Image(selection)
                                    
                              Picker("", selection: self.$selection) {
                        
                                ForEach(holidayDestinations) { dest in
                        
                                  Text(dest)
                        
                                }
                              }
                            }
                          }
                        }
                        """)
                    
                    Spacer()
                    
                    VStack(spacing: 30) {
                        Image(self.selection)
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width * 0.35, height: geometry.size.width * 0.35)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        
                        Picker("", selection: self.$selection) {
                            ForEach(self.holidayDestinations, id: \.self) { destination in
                                Text(destination)
                                    .font(.title)
                            }
                        }
                        .pickerStyle(RadioGroupPickerStyle())
                    }
                    .frame(width: geometry.size.width * 0.4, height: geometry.size.height)
                    
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct StateWrapper_Previews: PreviewProvider {
    static var previews: some View {
        StateWrapper()
    }
}
