//
//  ListLabelGroupView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 03.09.2024.
//

import SwiftUI
import SwiftData

struct ListLabelGroupView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Query var labelGroups: [LabelGroup]
    
    @State private var error: Bool = false
    @State private var errorMessage: String = ""
    
    var body: some View {
        List {
            ForEach(labelGroups) { labelGroup in
                NavigationLink(value: SeeLabelGroup(labelGroup: labelGroup)) {
                    HStack {
                        Text(labelGroup.name)
                        Spacer()
                        Text((labelGroup.vinyls != nil ? String(labelGroup.vinyls!.count) : "0") + " vinyl" + (labelGroup.vinyls != nil && labelGroup.vinyls!.count > 1 ? "s" : ""))
                            .foregroundStyle(.gray)
                    }
                }
            }
            .onDelete(perform: deleteLabelGroup)
        }
        .modifier(ErrorAlertModifier(isPresented: $error, errorMessage: errorMessage))
    }
    
    init(searchString: String = "", sortOrder: [SortDescriptor<LabelGroup>] = []) {
        _labelGroups = Query(filter: #Predicate { labelGroup in
            if searchString.isEmpty {
                true
            } else {
                labelGroup.name.localizedStandardContains(searchString)
            }
        }, sort: sortOrder)
    }
    
    func deleteLabelGroup(at offsets: IndexSet) {
        for offset in offsets {
            let labelGroup = labelGroups[offset]
            if labelGroup.vinyls == nil || labelGroup.vinyls!.isEmpty {
                modelContext.delete(labelGroup)
            } else {
                errorMessage = "You can't delete this label because there is vinyls attached to him."
                error = true
            }
        }
    }
}
