//
//  CodeBox.swift
//  techie_brekkie
//
//  Created by David Grew on 06/07/2020.
//  Copyright © 2020 David Grew. All rights reserved.
//

import SwiftUI

struct CodeBox: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .font(.system(.title, design: .monospaced))
            .foregroundColor(.white)
            .padding()
            .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.gray).opacity(0.25))
            .shadow(radius: 20)
    }
}

struct CodeBox_Previews: PreviewProvider {
    static var previews: some View {
        CodeBox(text: "some code")
    }
}
