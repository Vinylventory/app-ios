//
//  AddOrEditLabel.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 31.08.2024.
//

import SwiftUI
import SwiftData

struct AddOrEditLabelView: View {
    
    @Bindable var label: LabelGroup
    
    @Binding var showPopover: Bool
    
    var addAfter: Bool
    
    var addLabel: (LabelGroup) -> Void
        
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField("Name", text: $label.name)
                }
            }
            .navigationBarTitle((addAfter ? "Add New" : "Edit") + " Label", displayMode: .inline)
            .if(addAfter) { view in
                view.toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            addLabel(label)
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
