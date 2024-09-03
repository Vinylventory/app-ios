//
//  ErrorAlertModifier.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 03.09.2024.
//

import SwiftUI

struct ErrorAlertModifier: ViewModifier {
    
    @Binding var isPresented: Bool
    var errorMessage: String

    func body(content: Content) -> some View {
        content
            .alert("Error", isPresented: $isPresented) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(errorMessage)
            }
    }
}
