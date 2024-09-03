//
//  VinylImageList.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 03.09.2024.
//

import SwiftUI

struct VinylImageList: View {
    @Bindable var vinyl: Vinyl
    @Binding var showImageContext: Bool
    
    var body: some View {
        Section(header: Text("Images")) {
            List {
                if vinyl.images != nil && !vinyl.images!.isEmpty {
                    ForEach(vinyl.images!) { image in
                        HStack {
                            if image.data != nil {
                                Image(uiImage: UIImage(data: image.data!)!)
                                    .resizable()
                                    .frame(width: 200, height: 200)
                            }
                        }
                    }
                    .onDelete(perform: { offsets in
                        for offset in offsets {
                            vinyl.images!.remove(at: offset)
                        }
                    })
                }
                Button("Add Image", systemImage: "plus", action: {
                    showImageContext = true
                })
            }
        }
    }
}
