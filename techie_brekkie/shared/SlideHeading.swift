//
//  SlideHeading.swift
//  techie_brekkie
//
//  Created by David Grew on 06/07/2020.
//  Copyright © 2020 David Grew. All rights reserved.
//

import SwiftUI

struct SlideHeading: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 56, weight: .heavy, design: Font.Design.default))
    }
}

struct SlideHeading_Previews: PreviewProvider {
    static var previews: some View {
        SlideHeading(text: "test")
    }
}
