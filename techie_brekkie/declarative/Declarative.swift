//
//  Declarative.swift
//  techie_brekkie
//
//  Created by David Grew on 17/11/2020.
//  Copyright © 2020 David Grew. All rights reserved.
//

import SwiftUI

struct Declarative: View {
    
    @State var showView: Bool = false
    
    let holidayLocations = ["France", "Spain", "Germany", "Italy", "Sweden"]
    
    var body: some View {
        VStack {
            HStack {
                SlideHeading(text: "Declarative UI Framework")
                Spacer()
            }
            .padding(20)
            
            Spacer()
            
            HStack {
            
                Spacer()
                
                CodeBox(text: """
                    struct MyView: View {
                      \(self.showView ? "\n  var holidayLocations = [...]\n" : "")
                      var body: some View {
                        \(self.showView ? "\n    List(holidayLocations) { location in\n\n      Text(location)\n" : "")
                      }

                    }
                    """)
                    .onTapGesture(perform: { self.showView.toggle() })
                
                Spacer()
                
                if showView {
                    List(holidayLocations, id: \.self) { location in
                        Text(location)
                    }
                    .frame(width: 100, height: 200)
                }
                
                Spacer()
            }
            .padding()
            
            Spacer()
        }
    }
}

struct Declarative_Previews: PreviewProvider {
    static var previews: some View {
        Declarative()
    }
}
