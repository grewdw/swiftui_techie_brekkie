//
//  CrossPlatform.swift
//  techie_brekkie
//
//  Created by David Grew on 15/11/2020.
//  Copyright © 2020 David Grew. All rights reserved.
//

import SwiftUI

struct CrossPlatform: View {
    var body: some View {
        VStack {
            HStack {
                SlideHeading(text: "Cross Platform")
                Spacer()
            }
            .padding(20)
            
            Spacer()
            
            Image("CrossPlatform")
                .resizable()
                .scaledToFit()
                .padding()
            
            Spacer()
        }
    }
}
