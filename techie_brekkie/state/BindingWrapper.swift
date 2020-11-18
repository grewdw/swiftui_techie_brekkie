//
//  BindingWrapper.swift
//  techie_brekkie
//
//  Created by David Grew on 06/07/2020.
//  Copyright © 2020 David Grew. All rights reserved.
//

import SwiftUI

struct BindingWrapper: View {
    
    @State var currency: Currency = .Pound
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                VStack {
                    Spacer()
                    VStack(spacing: 50) {
                        Item(label: "Sandals", cost: 7.99 * self.currency.rawValue, currency: self.currency)
                        Item(label: "Bucket & Spade", cost: 13.50 * self.currency.rawValue, currency: self.currency)
                        Item(label: "Canoe", cost: 54.99 * self.currency.rawValue, currency: self.currency)
                        Divider()
                        Item(label: "Total", cost: 76.48 * self.currency.rawValue, currency: self.currency)
                    }
                    .frame(width: geometry.size.width * 0.3)
                    .padding()
                    .background(Color.blue)
                    Spacer()
                    CodeBox(text: """
                        struct Receipt: View {
                        

                          @State var currency: Currency = \(self.currency)


                          var body: some View {
                        
                            HStack {
                              ItemForm()
                            
                              CurrencySelector(currency: $currency)
                        
                            }
                          }
                        }
                        """)
                }
                .frame(width: geometry.size.width * 0.48, height: geometry.size.height * 0.9)
                
                VStack(spacing: 50) {
                    Spacer()
                    CurrencySelector(currency: self.$currency)
                        .padding()
                        .background(Color.red)
                    Spacer()
                    CodeBox(text: """
                        struct CurrencySelector: View {


                          @Binding var currency: Currency


                          var body: some View {
                          
                            Picker("Currency", selection: $currency) {
                            
                              ForEach(Currency.currencies) { c in

                                Text(Currency.getName(c))

                            }
                          }
                        }
                        """)
                }
                .frame(width: geometry.size.width * 0.48, height: geometry.size.height * 0.9)
            }
        }
    }
}

struct CurrencySelector: View {
    
    @Binding var currency: Currency
    
    var body: some View {
        Picker("Currency", selection: $currency) {
            ForEach(Currency.currencies, id: \.self) { c in
                Text(Currency.getName(c))
            }
        }
    }
}

struct Item: View {
    
    var label: String
    var cost: Double
    var currency: Currency
    
    var body: some View {
        HStack {
            Text(label)
                .font(.title)
            Spacer()
            Text("\(Currency.getSymbol(currency))\(String(format: "%.2f", cost))")
                .font(.title)
        }
    }
}

enum Currency: Double {
    
    case Pound = 1
    case Dollar = 1.4
    case Euro = 1.1
    
    static var currencies: [Currency] = [.Pound, .Dollar, .Euro]

    static func getName(_ currency: Currency) -> String {
        switch currency {
        case .Pound:
            return "Pound"
        case .Dollar:
            return "Dollar"
        case .Euro:
            return "Euro"
        }
    }
    
    static func getSymbol(_ currency: Currency) -> String {
        switch currency {
        case .Pound:
            return "£"
        case .Dollar:
            return  "$"
        case .Euro:
            return "€"
        }
    }
}

struct BindingWrapper_Previews: PreviewProvider {
    static var previews: some View {
        BindingWrapper()
    }
}
