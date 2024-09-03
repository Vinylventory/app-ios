//
//  AddOrEditLabel.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 31.08.2024.
//

import SwiftUI
import SwiftData

struct AddOrEditLabelView: View {
    
    @StateObject var options: AddOrEditOptions<LabelGroup>
    
    var body: some View {
        AddOrEditView(options: options) {
            Form {
                Section(header: Text("Informations")) {
                    TextField("Name", text: $options.value.name)
                }
            }
        }
    }
}
