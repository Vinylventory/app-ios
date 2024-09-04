//
//  VinylImageList.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 03.09.2024.
//

import SwiftUI
import PhotosUI

struct VinylImageList: View {
    
    @Bindable var vinyl: Vinyl
    @Binding var showImageContext: Bool
    
    @State private var isPresentingPicker = false
    @State private var isPresentingCamera = false
    
    @State var showActionSheet = false
    
    @State private var imageImported: PhotosPickerItem? = nil
    
    @State private var error: Bool = false
    @State private var errorMessage: String = ""
    
    @Binding var selectedImage: UIImage?
    
    var body: some View {
        Section(header: Text("Images")) {
            List {
                if vinyl.images != nil && !vinyl.images!.isEmpty {
                    ForEach(vinyl.images!) { image in
                        HStack {
                            if image.data != nil {
                                NavigationLink(value: SeeImage(image: UIImage(data: image.data!)!)) {
                                    Image(uiImage: UIImage(data: image.data!)!)
                                        .resizable()
                                        .frame(width: 200, height: 200)
                                }
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
                .actionSheet(isPresented: $showImageContext) {
                    ActionSheet(
                        title: Text("Select Image"),
                        message: Text("Choose an image from your library or take a new photo"),
                        buttons: [
                            .default(Text("Photo Library")) {
                                isPresentingPicker = true
                            },
                            .default(Text("Camera")) {
                                isPresentingCamera = true
                            },
                            .cancel()
                        ]
                    )
                }
                .photosPicker(isPresented: $isPresentingPicker, selection: $imageImported)
                .sheet(isPresented: $isPresentingCamera) {
                    ImagePicker(sourceType: .camera, selectedImage: $selectedImage)
                }
                .onChange(of: imageImported) {
                    Task {
                        if imageImported != nil {
                            do {
                                if let data = try await imageImported!.loadTransferable(type: Data.self) {
                                    selectedImage = UIImage(data: data)
                                }
                            } catch {
                                self.error = true
                                errorMessage = error.localizedDescription
                            }
                        }
                    }
                }
                .modifier(ErrorAlertModifier(isPresented: $error, errorMessage: errorMessage))
            }
        }
    }
}
