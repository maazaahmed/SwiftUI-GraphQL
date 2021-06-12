//
//  Apollo.swift
//  SwiftUI-GraphQL
//
//  Created by Macbook Pro on 12/06/2021.
//

import Foundation
import Apollo


class Network {
    static let shared = Network()
    lazy var apollo = ApolloClient(url: URL(string: "https://countries.trevorblades.com/")!)
}
