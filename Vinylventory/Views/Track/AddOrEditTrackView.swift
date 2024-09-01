//
//  AddOrEditTrackView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 01.09.2024.
//

import SwiftUI

struct AddOrEditTrackView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Bindable var track: Track
    
    @Binding var showPopover: Bool
    
    var addAfter: Bool
    
    var addTrack: (Track) -> Void
    
    @State private var duration: Bool = false
    
    @State private var durationVal: Int = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Informations")) {
                    TextField("Name", text: $track.name)
                    
                    Toggle("Enable Duration Time", isOn: $duration)
                    
                    if duration {
                        HStack {
                            Text("Duration").foregroundStyle(.gray)
                            Spacer()
                            TextField("Enter Duration", value: $durationVal, formatter: NumberFormatter())
                                .keyboardType(.numberPad)
                        }
                    }
                }
            }
            .navigationBarTitle((addAfter ? "Add New" : "Edit") + " Track", displayMode: .inline)
            .if(addAfter) { view in
                view.toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            addTrack(track)
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
            .onChange(of: durationVal) {
                track.duration = durationVal
            }
            .onChange(of: duration) {
                if duration {
                    durationVal = 0
                    track.duration = 0
                } else {
                    track.duration = nil
                }
            }
        }
    }
}
