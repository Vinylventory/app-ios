//
//  AddOrEditArtistView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 01.09.2024.
//

import SwiftUI
import SwiftData

struct AddOrEditView<T: PersistentModel, Content: View>: View {
    
    @StateObject var options: AddOrEditOptions<T>
    
    let content: Content

    private var name: String {
        switch options.value.id.entityName {
        case "LabelGroup": "Label"
        case "Bought": "Purchase"
        default: options.value.id.entityName
        }
    }
    
    init(options: AddOrEditOptions<T>, @ViewBuilder content: () -> Content) {
        _options = StateObject(wrappedValue: options)
        self.content = content()
    }
    
    var body: some View {
        content
            .navigationBarTitle((options.addAfter ? "Add New" : "Edit") + " " + name, displayMode: options.displayMode)
            .if(options.addAfter) { view in
                view.toolbar {
                    ToolbarItem(placement: options.placement) {
                        Button(action: {
                            options.addValue(options.value)
                            options.showPopover(false)
                        }) {
                            Label("", systemImage: "plus")
                        }.padding()
                    }
                }
            }
            .if(!options.revertButtons) { view in
                view.navigationBarItems(trailing: Button("Cancel") {
                    options.showPopover(false)
                }.padding())
            }
    }
}
