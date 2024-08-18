import SwiftUI
import PhotosUI
import CoreTransferable
import Capture

struct ImageListView: View {
    @Binding var images: [UIImage]
    
    @State private var capturedImage: UIImage?
    
    @State private var showPickers = false
    @State private var showPhotoPicker = false
    @State private var showCameraPicker = false
    
    @State var selectedItems: [PhotosPickerItem] = []
    
    var body: some View {
        Section(header: Text("Images")) {
            ForEach(images.indices, id: \.self) { index in
                NavigationLink(destination: FullScreenImageView(image: images[index])) {
                    HStack {
                        Image(uiImage: images[index])
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipped()
                        
                        Spacer()
                    }
                }
                .swipeActions {
                    Button(role: .destructive) {
                        images.remove(at: index)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
            
            Button(action: {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    showPickers = true
                }
            }) {
                Label("Add Image", systemImage: "plus")
            }
            .confirmationDialog("Select Image Source", isPresented: $showPickers) {
                Button("Camera") {
                    showCameraPicker = true
                }
                Button("Photo Library") {
                    showPhotoPicker = true
                }
                Button("Cancel", role: .cancel) { }
            }
            .photosPicker(
                isPresented: $showPhotoPicker,
                selection: $selectedItems,
                matching: .images,
                photoLibrary: .shared())
            .onChange(of: selectedItems) {
                for item in selectedItems {
                    item.loadTransferable(type: Data.self) { result in
                        switch result {
                        case .success(let imageData):
                            if let imageData {
                                self.images.append(UIImage(data: imageData)!)
                            } else {
                                print("No supported content type found.")
                            }
                        case .failure(let error):
                            print(error)
                        }
                    }
                }
                selectedItems = []
            }
            .fullScreenCover(isPresented: $showCameraPicker) {
                CameraView(outputImage: $capturedImage) { authorizationStatus in
                    cameraOverlay(authorizationStatus)
                }
            }
            .onChange(of: capturedImage) {
                if capturedImage != nil {
                    self.images.append(capturedImage!)
                }
            }
        }
    }
    
    @ViewBuilder
    func cameraOverlay(_ status: AVAuthorizationStatus) -> some View {
        
        switch status {
        case .notDetermined:
            Text("Please authorize camera")

        case .denied, .restricted:
            VStack {
                Label("Camera denied or restricted", systemImage: "video")
                    .frame(width: 200)
                    .symbolVariant(.slash)
                    .font(.headline)
                    .padding(32)
                Button(action: {
                    self.showCameraPicker = false
                }, label: {
                    Text("Back").padding()
                })
            }

        case .authorized:
            CameraPhotoOverlay()

        @unknown default:
            fatalError()
        }
    }
}

struct CameraPhotoOverlay: View {
    @Environment(\.takePicture) private var takePicture
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Color.clear.safeAreaInset(edge: .bottom) {
            CameraButton(style: .photo) {
                takePicture()
                presentationMode.wrappedValue.dismiss()
            }
        }
        .overlay(alignment: .topLeading) {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Back").padding()
            })
        }
    }
}

struct FullScreenImageView: View {
    
    var image: UIImage
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Spacer()
            
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
            
            Spacer()
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .navigationBarTitle("Image Preview", displayMode: .inline)
    }
}

extension UIImage: Identifiable {
    public var id: ObjectIdentifier {
        ObjectIdentifier(self)
    }
}

#Preview {
    ImageListView(images: .constant([]))
}
