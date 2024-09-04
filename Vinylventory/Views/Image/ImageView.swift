//
//  ImageView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 04.09.2024.
//

import SwiftUI
import UIKit

struct ImageView: UIViewControllerRepresentable {
    let image: UIImage
    
    func makeUIViewController(context: Context) -> ImageViewerController {
        let viewController = ImageViewerController()
        viewController.image = image
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: ImageViewerController, context: Context) {}
}

class ImageViewerController: UIViewController, UIScrollViewDelegate {
    var image: UIImage?
    private var imageView: UIImageView!
    private var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupImageView()
    }
    
    private func setupScrollView() {
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 5.0
        view.addSubview(scrollView)
    }
    
    private func setupImageView() {
        guard let image = image else { return }
        imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = scrollView.bounds
        imageView.isUserInteractionEnabled = true
        scrollView.addSubview(imageView)
        scrollView.contentSize = imageView.bounds.size
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
