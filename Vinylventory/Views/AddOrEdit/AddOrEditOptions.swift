//
//  AddOrEdit.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 03.09.2024.
//

import SwiftUI
import SwiftData

class AddOrEditOptions<T>: ObservableObject where T : PersistentModel {
    @Published var value: T
    var showPopover: (Bool) -> Void
    var addAfter: Bool
    var addValue: (T) -> Void
    var revertButtons: Bool = false

    init(value: T, showPopover: @escaping (Bool) -> Void, addAfter: Bool, addValue: @escaping (T) -> Void, revertButtons: Bool = false) {
        self.value = value
        self.showPopover = showPopover
        self.addAfter = addAfter
        self.addValue = addValue
        self.revertButtons = revertButtons
    }

    var placement: ToolbarItemPlacement {
        return !revertButtons ? .topBarLeading : .topBarTrailing
    }
    
    var displayMode: NavigationBarItem.TitleDisplayMode {
        return !revertButtons ? .inline : .large
    }
}
