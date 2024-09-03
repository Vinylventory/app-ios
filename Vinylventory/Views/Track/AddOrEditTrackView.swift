//
//  AddOrEditTrackView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 01.09.2024.
//

import SwiftUI

struct AddOrEditTrackView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @StateObject var options: AddOrEditOptions<Track>
    
    @State private var duration: Bool = false
    
    @State private var durationVal: Int = 0
    
    var body: some View {
        AddOrEditView(options: options) {
            Form {
                Section(header: Text("Informations")) {
                    TextField("Name", text: $options.value.name)
                    
                    Toggle("Enable Duration Time", isOn: $duration)
                    
                    if duration {
                        HStack {
                            Text("Duration (seconds)").foregroundStyle(.gray)
                            Spacer()
                            TextField("Enter Duration", value: $durationVal, formatter: NumberFormatter())
                                .keyboardType(.numberPad)
                        }
                    }
                }
            }
            .onChange(of: durationVal) {
                options.value.duration = durationVal
            }
            .onChange(of: duration) {
                if duration {
                    durationVal = 0
                    options.value.duration = 0
                } else {
                    options.value.duration = nil
                }
            }
        }
    }
}
