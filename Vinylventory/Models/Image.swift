//
//  Image.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 03.09.2024.
//

import SwiftUI
import SwiftData
import UIKit
import CoreImage

@Model
class ImageModel {
    @Attribute(.externalStorage) var data: Data?
    
    var vinyl: Vinyl?
    
    init(data: Data? = nil, vinyl: Vinyl? = nil) {
        self.data = data
        self.vinyl = vinyl
    }
}
