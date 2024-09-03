//
//  ListBoughtView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 03.09.2024.
//

import SwiftUI
import SwiftData

struct ListBoughtView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Query var boughts: [Bought]
    
    @State private var error: Bool = false
    @State private var errorMessage: String = ""
    
    var body: some View {
        List {
            ForEach(boughts) { bought in
                NavigationLink(value: SeeBought(bought: bought)) {
                    HStack {
                        Text(bought.loc)
                        Spacer()
                        Text(bought.date != nil ? DateFormatter().apply {$0.dateStyle = .short} .string(from: bought.date!) : "")
                        Spacer()
                        Text((bought.vinyls != nil ? String(bought.vinyls!.count) : "0") + " vinyl" + (bought.vinyls != nil && bought.vinyls!.count > 1 ? "s" : ""))
                            .foregroundStyle(.gray)
                    }
                }
            }
            .onDelete(perform: deleteArtist)
        }
        .modifier(ErrorAlertModifier(isPresented: $error, errorMessage: errorMessage))
    }
    
    init(searchString: String = "", sortOrder: [SortDescriptor<Bought>] = []) {
        _boughts = Query(filter: #Predicate { bought in
            if searchString.isEmpty {
                true
            } else {
                bought.loc.localizedStandardContains(searchString)
                || bought.note.localizedStandardContains(searchString)
            }
        }, sort: sortOrder)
    }
    
    func deleteArtist(at offsets: IndexSet) {
        for offset in offsets {
            let bought = boughts[offset]
            if (bought.vinyls == nil || bought.vinyls!.isEmpty) {
                modelContext.delete(bought)
            } else {
                errorMessage = "You can't delete this purchase because there is vinyls attached to him."
                error = true
            }
        }
    }
}
