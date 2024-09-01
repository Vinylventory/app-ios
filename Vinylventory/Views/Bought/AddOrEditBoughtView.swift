//
//  AddOrEditBoughtView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 31.08.2024.
//

import SwiftUI

struct AddOrEditBoughtView: View {
    
    @Bindable var bought: Bought
    
    @Binding var showPopover: Bool
    
    var addAfter: Bool
    
    var addBought: (Bought) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Informations")) {
                    TextField("Location Bought", text: $bought.loc)
                    
                    DatePickerOptional(title: "Date Bought", displayedComponents: .date, selection: $bought.date)
                    
                    HStack {
                        Text("Price Bought").foregroundStyle(.gray)
                        Spacer()
                        TextField("Enter Price", value: $bought.price, formatter: NumberFormatter())
                            .keyboardType(.decimalPad)
                    }
                    TextField("Note Bought", text: $bought.note)
                }
            }
            .navigationBarTitle((addAfter ? "Add New" : "Edit") + " Bought", displayMode: .inline)
            .if(addAfter) { view in
                view.toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            addBought(bought)
                            self.showPopover = false
                        }) {
                            Label("", systemImage: "plus")
                        }.padding()
                    }
                }
            }
            .navigationBarItems(trailing: Button("Cancel") {
                self.showPopover = false
            }.padding())
        }
    }
}
