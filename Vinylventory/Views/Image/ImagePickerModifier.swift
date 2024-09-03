//
//  ImagePickerModifier.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 03.09.2024.
//

import SwiftUI
import PhotosUI

struct ImagePickerModifier: ViewModifier {
    @Binding var image: UIImage?
    @State private var isPresentingPicker = false
    @State private var isPresentingCamera = false
    @State var showActionSheet = false
    
    @State private var imageImported: PhotosPickerItem? = nil
    
    @State private var error: Bool = false
    @State private var errorMessage: String = ""
    
    func body(content: Content) -> some View {
        content
            .actionSheet(isPresented: $showActionSheet) {
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
                ImagePicker(sourceType: .camera, selectedImage: $image)
            }
            .onChange(of: imageImported) {
                Task {
                    if imageImported != nil {
                        do {
                            if let data = try await imageImported!.loadTransferable(type: Data.self) {
                                image = UIImage(data: data)
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
