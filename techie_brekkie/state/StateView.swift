//
//  State.swift
//  techie_brekkie
//
//  Created by David Grew on 06/07/2020.
//  Copyright © 2020 David Grew. All rights reserved.
//

import SwiftUI

struct StateView: View {
    @State var selection: StateViewType = .State
    
    var body: some View {
        VStack {
            HStack {
                SlideHeading(text: "State")
                Spacer()
            }
            .padding(20)
            
            Picker(selection: $selection, label: EmptyView()) {
                ForEach(StateViewType.types, id: \.self) { type in
                    Text(type.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Spacer()
            
            if selection == .State {
                StateWrapper()
            } else if selection == .Binding {
                BindingWrapper()
            }
        }
    }
}

enum StateViewType: String {
    
    case State = "@State"
    case Binding = "@Binding"
    case ObservableObject = "@ObservableObject"
    case EnvironmentObject = "@EnvironmentObject"
    
    static var types: [StateViewType] = [StateViewType.State, StateViewType.Binding, StateViewType.ObservableObject, StateViewType.EnvironmentObject]
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView()
    }
}
