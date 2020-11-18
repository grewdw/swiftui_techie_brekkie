//
//  ObservableObjectWrapper.swift
//  techie_brekkie
//
//  Created by David Grew on 18/11/2020.
//  Copyright © 2020 David Grew. All rights reserved.
//

import SwiftUI

struct ObservableObjectWrapper: View {
    
    @ObservedObject var flight: Flight = Flight()
    var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateStyle = .long
        return df
    }
    
    var body: some View {
        VStack {
        
            Spacer()
            
            HStack {
                
                Spacer()
                
                VStack {
                    CodeBox(text: """
                        class Flight: ObservableObject {
                        
                          @Published var departureTime: Date

                          @Published var arrivalTime: Date

                          @Published var airport: String

                          @Published var terminal: Int

                        }
                        """)
                    
                    CodeBox(text: """
                        struct FlightView: View {
                        
                          @ObservedObject var flight: Flight

                          var body: some View {
                            
                            VStack {

                              Text("Arrival Time: \\(flight.$arrivalTime)")

                              Text("Departure Time: \\(flight.$departureTime)")

                              Text("Airport: \\(flight.$airport)")

                              Text("Terminal: \\(flight.$terminal)")

                            }

                          }

                        }
                        """)
                }
                
                Spacer()
                
                HStack {
                    VStack {
                        Text("Arrival Time:\n")
                            .font(.title)
                            .frame(width: 200, alignment: .leading)
                        Text("Departure Time:\n")
                            .font(.title)
                            .frame(width: 200, alignment: .leading)
                        Text("Airport:\n")
                            .font(.title)
                            .frame(width: 200, alignment: .leading)
                        Text("Terminal:\n")
                            .font(.title)
                            .frame(width: 200, alignment: .leading)
                    }
                    
                    VStack {
                        Text("\(dateFormatter.string(from: self.flight.departureTime))\n")
                            .font(.title)
                            .frame(width: 200, alignment: .leading)
                        Text("\(dateFormatter.string(from: self.flight.arrivalTime))\n")
                            .font(.title)
                            .frame(width: 200, alignment: .leading)
                        Text("\(self.flight.airport)\n")
                            .font(.title)
                            .frame(width: 200, alignment: .leading)
                        Text("\(String(self.flight.terminal))\n")
                            .font(.title)
                            .frame(width: 200, alignment: .leading)
                    }
                }
                .padding()
                .background(Color.blue)
                
                Spacer()
            }
            
            Spacer()
        }
        .padding()
    }
}

class Flight: ObservableObject {
    
    @Published var departureTime: Date = Date(timeIntervalSinceNow: 600)
    @Published var arrivalTime: Date = Date(timeIntervalSinceNow: 60000)
    @Published var airport: String = "Southampton"
    @Published var terminal: Int = 1
}

struct ObservableObjectWrapper_Previews: PreviewProvider {
    static var previews: some View {
        ObservableObjectWrapper()
    }
}
