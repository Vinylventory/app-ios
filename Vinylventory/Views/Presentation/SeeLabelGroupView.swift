//
//  SeeLabelGroupView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 03.09.2024.
//

import SwiftUI

struct SeeLabelGroupView: View {
    @Bindable var labelGroup: LabelGroup
    
    var body: some View {
        Form {
            Section(header: Text("Informations")) {
                HStack {
                    Text("Name")
                    Spacer()
                    Text(labelGroup.name.isEmpty ? "N/A" : labelGroup.name)
                }
            }
            
            Section(header: Text("Vinyls")) {
                if let vinyls = labelGroup.vinyls, !vinyls.isEmpty {
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
                    Text("No vinyls in this label")
                }
            }
        }
        .navigationTitle("Label " + labelGroup.name)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(value: EditLabelGroup(labelGroup: labelGroup))  {
                    Label("", systemImage: "pencil")
                }.padding()
            }
        }
    }
}
