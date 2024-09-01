//
//  ListLabelView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 31.08.2024.
//

import SwiftUI
import SwiftData

struct ListLabelView: View {
    @Environment(\.modelContext) var modelContext
    
    @Binding var showPopover: Bool
    
    var addLabel: (LabelGroup) -> Void
    var setLabel: (LabelGroup) -> Void
    
    @State private var searchText: String = ""
    @State private var showAdd: Bool = false
    
    @State private var error: Bool = false
    @State private var errorMessage: String = ""
    
    @Query private var labels: [LabelGroup]
        
    var body: some View {
        NavigationView {
            Form {
                List {
                    ForEach(labels.filter {
                        searchText.isEmpty ? true : $0.name.contains(searchText)
                    }) { label in
                        Button(action: {
                            self.showPopover = false
                            setLabel(label)
                        }) {
                            HStack {
                                Text(label.name)
                                Spacer()
                                Text((label.vinyls != nil ? String(label.vinyls!.count) : "0") + " vinyl" + (label.vinyls != nil && label.vinyls!.count > 1 ? "s" : ""))
                                    .foregroundStyle(.gray)
                            }
                        }
                    }.onDelete(perform: deleteLabel)
                }
            }
            .navigationBarTitle("Add Label", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                self.showAdd = true
            }) {
                Label("", systemImage: "plus")
            }.padding())
            .navigationBarItems(trailing: Button("Cancel") {
                self.showPopover = false
            }.padding())
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        }
        .sheet(isPresented: $showAdd) {
            AddOrEditLabelView(label: LabelGroup(name: ""), showPopover: $showAdd, addAfter: true) { label in
                addLabel(label)
            }
        }
        .alert("Error", isPresented: $error) {
            Button("OK") { }
        } message: {
            Text(errorMessage)
        }
    }
        
    func deleteLabel(at offsets: IndexSet) {
        for offset in offsets {
            let label = labels[offset]
            if label.vinyls == nil || label.vinyls!.isEmpty {
                modelContext.delete(label)
            } else {
                errorMessage = "You can't delete this label because there is vinyls attached to him."
                error = true
            }
        }
    }
}

#Preview {
    ListLabelView(showPopover: .constant(true), addLabel: {label in}, setLabel: {label in})
}
