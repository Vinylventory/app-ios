//
//  Network.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 13.08.2024.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    var apollo = ApolloClient(url: URL(string: "http://localhost:4000/")!)
}
