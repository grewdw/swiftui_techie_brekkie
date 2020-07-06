//
//  Intro.swift
//  techie_brekkie
//
//  Created by David Grew on 03/07/2020.
//  Copyright © 2020 David Grew. All rights reserved.
//

import SwiftUI

struct Intro: View {
    
    @Binding var visible: Bool
    
    var body: some View {
        GeometryReader { geometry in
            Image("wwdc_screenshot")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: geometry.size.width * 0.9, maxHeight: geometry.size.height * 0.9)
                .shadow(radius: 20)
                .background(Color.black.opacity(0.9).frame(width: geometry.size.width, height: geometry.size.height))
                    .onTapGesture {
                        withAnimation(.easeIn) {
                            self.visible.toggle()
                        }
                }
        }
    }
}

//struct Intro_Previews: PreviewProvider {
//    static var previews: some View {
//        Intro()
//    }
//}
