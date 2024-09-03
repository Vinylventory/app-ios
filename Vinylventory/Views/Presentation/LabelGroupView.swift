//
//  LabelGroupView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 03.09.2024.
//

import SwiftUI

struct LabelGroupView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Binding var path: NavigationPath
    
    @State private var sortOrder = [SortDescriptor(\LabelGroup.name)]
    @State private var searchText = ""
    
    var body: some View {
        ListLabelGroupView(searchString: searchText, sortOrder: sortOrder)
            .navigationBarTitle("Label List", displayMode: .large)
            .toolbar {
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Name (A-Z)")
                            .tag([SortDescriptor(\LabelGroup.name)])
                        
                        Text("Name (Z-A)")
                            .tag([SortDescriptor(\LabelGroup.name, order: .reverse)])
                    }
                }
                
                Button("Add Label", systemImage: "plus", action: addLabelGroup)
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
    }
    
    func addLabelGroup() {
        let label = LabelGroup(name: "")
        path.append(label)
    }
}
