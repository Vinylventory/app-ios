//
//  DatePickerOptional.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 30.08.2024.
//

import SwiftUI

struct DatePickerOptional: View {
    var title: String
    var preOptionalTitle: String = "Include "
    
    var displayedComponents: DatePicker.Components
    
    @Binding var selection: Optional<Date>
    
    @State private var option: Bool = false
    
    @State private var date: Date = .now
    
    var body: some View {
        VStack {
            Toggle(preOptionalTitle + title, isOn: $option)
            
            if option {
                DatePicker(title, selection: $date, displayedComponents: .date)
            }
        }
        .onChange(of: date) {
            selection = date
        }
        .onChange(of: option) {
            if option {
                selection = .now
                date = .now
            } else {
                selection = nil
            }
        }
    }
}
