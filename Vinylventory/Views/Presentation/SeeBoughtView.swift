//
//  SeeBoughtView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 03.09.2024.
//

import SwiftUI

struct SeeBoughtView: View {
    @Bindable var bought: Bought
    
    var body: some View {
        Form {
            Section(header: Text("Informations")) {
                HStack {
                    Text("Location")
                    Spacer()
                    Text(bought.loc.isEmpty ? "N/A" : bought.loc)
                }
                HStack {
                    Text("Date")
                    Spacer()
                    Text(bought.date == nil ? "N/A" : DateFormatter().apply {$0.dateStyle = .short} .string(from: bought.date!))
                }
                HStack {
                    Text("Price")
                    Spacer()
                    Text(bought.price == 0 ? "N/A" : String(bought.price))
                }
                HStack {
                    Text("Note")
                    Spacer()
                    Text(bought.note.isEmpty ? "N/A" : bought.note)
                }
            }
            
            Section(header: Text("Vinyls")) {
                if let vinyls = bought.vinyls, !vinyls.isEmpty {
                    ForEach(vinyls, id: \.self) { vinyl in
                        NavigationLink(value: SeeVinyl(vinyl: vinyl)) {
                            HStack {
                                if vinyl.label != nil {
                                    Text(vinyl.label!.name)
                                }
                                Text(vinyl.catNumber)
                            }
                        }
                    }
                } else {
                    Text("No vinyls in this purchase")
                }
            }
        }
        .navigationTitle("Purchase " + bought.loc)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(value: EditBought(bought: bought))  {
                    Label("", systemImage: "pencil")
                }.padding()
            }
        }
    }
}
