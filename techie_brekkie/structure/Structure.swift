//
//  Structure.swift
//  techie_brekkie
//
//  Created by David Grew on 07/07/2020.
//  Copyright © 2020 David Grew. All rights reserved.
//

import SwiftUI

struct Structure: View {
    
    @State var selection: StructureViewType = .VSTACK
    
    var body: some View {
        VStack {
            HStack {
                SlideHeading(text: "Structure & Positioning")
                Spacer()
            }
            .padding(20)
            
            Picker(selection: $selection, label: EmptyView()) {
                ForEach(StructureViewType.types, id: \.self) { type in
                    Text(type.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Spacer()
            
            if selection == StructureViewType.VSTACK {
                VstackView()
            } else if selection == StructureViewType.HSTACK {
                HStackView()
            } else if selection == StructureViewType.ZSTACK {
                ZStackView()
            }
        }
    }
}

enum StructureViewType: String {
    
    case VSTACK = "VStack"
    case HSTACK = "HStack"
    case ZSTACK = "ZStack"
    
    static var types: [StructureViewType] = [.VSTACK, .HSTACK, .ZSTACK]
}

struct Structure_Previews: PreviewProvider {
    static var previews: some View {
        Structure()
    }
}
