//
//  BoughtView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 03.09.2024.
//

import SwiftUI

struct BoughtView: View {
    @Environment(\.modelContext) var modelContext
    
    @Binding var path: NavigationPath
    
    @State private var sortOrder = [SortDescriptor(\Bought.loc)]
    @State private var searchText = ""
    
    var body: some View {
        ListBoughtView(searchString: searchText, sortOrder: sortOrder)
            .navigationBarTitle("Purchase List", displayMode: .large)
            .toolbar {
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Localization (A-Z)")
                            .tag([SortDescriptor(\Bought.loc)])
                        
                        Text("Localization (Z-A)")
                            .tag([SortDescriptor(\Bought.loc, order: .reverse)])
                    }
                }
                
                Button("Add Bought", systemImage: "plus", action: addBought)
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
    }
    
    func addBought() {
        let bought = Bought(loc: "", price: 0, note: "")
        path.append(bought)
    }
}
