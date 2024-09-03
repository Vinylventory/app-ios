//
//  ListBoughtView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 31.08.2024.
//

import SwiftUI
import SwiftData

struct ListContextBoughtView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Binding var showPopover: Bool
    
    var addBought: (Bought) -> Void
    var setBought: (Bought) -> Void
    
    @State private var searchText: String = ""
    @State private var showAdd: Bool = false
    
    @State private var error: Bool = false
    @State private var errorMessage: String = ""
    
    @Query private var boughts: [Bought]
    
    var body: some View {
        NavigationStack {
            Form {
                List {
                    ForEach(boughts.filter {
                        searchText.isEmpty ? true : $0.loc.contains(searchText)
                    }) { bought in
                        Button(action: {
                            self.showPopover = false
                            setBought(bought)
                        }) {
                            HStack {
                                Text(bought.loc)
                                Spacer()
                                Text(bought.date != nil ? DateFormatter().apply {$0.dateStyle = .short} .string(from: bought.date!) : "")
                                Spacer()
                                Text((bought.vinyls != nil ? String(bought.vinyls!.count) : "0") + " vinyl" + (bought.vinyls != nil && bought.vinyls!.count > 1 ? "s" : ""))
                                    .foregroundStyle(.gray)
                            }
                        }
                    }.onDelete(perform: deleteBought)
                }
            }
            .navigationBarTitle("Add Purchase", displayMode: .inline)
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
            NavigationStack {
                AddOrEditBoughtView(options: AddOrEditOptions(value: Bought(loc: "", price: 0, note: ""), showPopover: { value in
                    showAdd = value
                }, addAfter: true) { bought in
                    addBought(bought)
                })
            }
        }
        .modifier(ErrorAlertModifier(isPresented: $error, errorMessage: errorMessage))
    }
    
    func deleteBought(at offsets: IndexSet) {
        for offset in offsets {
            let bought = boughts[offset]
            if bought.vinyls == nil || bought.vinyls!.isEmpty {
                modelContext.delete(bought)
            } else {
                errorMessage = "You can't delete this purchase because there is vinyls attached to him."
                error = true
            }
        }
    }
}
