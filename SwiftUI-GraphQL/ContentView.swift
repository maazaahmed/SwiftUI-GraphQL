//
//  ContentView.swift
//  SwiftUI-GraphQL
//
//  Created by Macbook Pro on 12/06/2021.
//

import SwiftUI

struct ContentView: View {
    @State var countryEmoji = ""
    @State var country = ""
    
    var body: some View {
        
        
        Color.purple.edgesIgnoringSafeArea(.all)
            
                // Ignore just for the color
                .overlay(
                    VStack(spacing: 20) {
                        Text(countryEmoji).onAppear(perform: {
                            Network.shared.apollo.fetch(query: SpecificCountryQuery()){ result in
                                switch result{
                                case .success(let graphlQLResult):
                                    DispatchQueue.main.async {
                                        if let emoji = graphlQLResult.data?.country?.emoji{
                                            self.countryEmoji = emoji
                                        }
                                    }
                                    
                                case .failure(let error):
                                    print("Error: ", error)
                                }
                                
                            }
                        })
                        
                        Text(country).onAppear(perform: {
                            Network.shared.apollo.fetch(query: SpecificCountryQuery()){ result in
                                switch result{
                                case .success(let graphlQLResult):
                                    DispatchQueue.main.async {
                                        if let cont = graphlQLResult.data?.country?.name{
                                            self.country = cont
                                        }
                                    }
                                    
                                case .failure(let error):
                                    print("Error: ", error)
                                }
                                
                            }
                        })
                        
                })
            
        
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
