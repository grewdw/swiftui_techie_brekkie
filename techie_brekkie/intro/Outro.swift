//
//  Outro.swift
//  techie_brekkie
//
//  Created by David Grew on 03/07/2020.
//  Copyright © 2020 David Grew. All rights reserved.
//

import SwiftUI

struct Outro: View {
    
    @Binding var visible: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .foregroundColor(.black)
                
                Text("Thank you for listening")
                    .font(.system(size: 128, weight: .heavy, design: Font.Design.default))
                
                VStack(alignment: .leading) {
                    Spacer()
                    Text("Source code for this presentation: https://github.com/grewdw/swiftui_techie_brekkie")
                        .font(.system(size: 32, weight: .heavy, design: Font.Design.default))
                    Spacer()
                    Text("By David Grew")
                        .font(.system(size: 32, weight: .heavy, design: Font.Design.default))
                    Spacer()
                }
                .frame(width: geometry.size.width * 0.9 - 100, height: 240, alignment: .leading)
                .offset(y: self.getTextY(height: geometry.size.height))
            }
            .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9)
            .shadow(radius: 20)
            .background(Color.black.opacity(0.9).frame(width: geometry.size.width, height: geometry.size.height))
                .onTapGesture {
                    withAnimation(.easeIn) {
                        self.visible.toggle()
                    }
            }
        }
    }
    
    func getTextY(height: CGFloat) -> CGFloat {
        return height * 0.45 - 150
    }
}

//struct Outro_Previews: PreviewProvider {
//    static var previews: some View {
//        Outro()
//    }
//}
