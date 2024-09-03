//
//  AddOrEditBoughtView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 31.08.2024.
//

import SwiftUI

struct AddOrEditBoughtView: View {
    
    @StateObject var options: AddOrEditOptions<Bought>
    
    var body: some View {
        AddOrEditView(options: options) {
            Form {
                Section(header: Text("Informations")) {
                    TextField("Location", text: $options.value.loc)
                    
                    DatePickerOptional(title: "Date", displayedComponents: .date, selection: $options.value.date)
                    
                    HStack {
                        Text("Price").foregroundStyle(.gray)
                        Spacer()
                        TextField("Enter Price", value: $options.value.price, formatter: NumberFormatter())
                            .keyboardType(.decimalPad)
                    }
                    TextField("Note", text: $options.value.note)
                }
            }
        }
    }
}
