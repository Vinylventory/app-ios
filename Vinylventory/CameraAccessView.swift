//
//  SwiftUIView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 17.08.2024.
//

import SwiftUI
import Capture

struct CameraAccessView: View {
    @State private var cameraAccessGranted: Bool = false
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            if cameraAccessGranted {
                Text("Camera Access Granted")
                    .foregroundColor(.green)
            } else {
                Text("Camera Access Not Granted")
                    .foregroundColor(.red)
            }
            
            Button("Request Camera Access") {
                requestCameraAccess()
            }
        }
        .onAppear {
            checkCameraAccessStatus()
        }
    }
    
    private func requestCameraAccess() {
        AVCaptureDevice.requestAccess(for: .video) { granted in
            DispatchQueue.main.async {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }

    private func checkCameraAccessStatus() {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        switch status {
        case .authorized:
            cameraAccessGranted = true
        case .denied, .restricted, .notDetermined:
            cameraAccessGranted = false
        @unknown default:
            cameraAccessGranted = false
        }
    }
}

#Preview {
    CameraAccessView()
}
