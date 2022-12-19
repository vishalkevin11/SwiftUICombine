//
//  AsyncImage.swift
//  SwiftUICombine
//
//  Created by Kevin.Saldanha on 19/12/22.
//

import Combine
import SwiftUI


final class ImageLoader: ObservableObject {
    @Published var uiImage: UIImage?
    
    var url: URL?
    
    func loadImage() {
        guard let url = url else {return }
        URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data)}
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: &$uiImage)
    }
}

struct AsynImageView:View {
    @StateObject private var imageLoader = ImageLoader()
    @Binding var url: String?
    
    init(url:  Binding<String?>) {
        print("URL \(url)")
        self._url = url
    }
    
    var image: some View {
        Group {
            if let image =  imageLoader.uiImage {
                Image(uiImage: image)
                    .resizable()
                    .frame(height: 200)
                    .scaledToFit()
                    .cornerRadius(16)
            } else {
                Text("No Image")
            }
        }
    }
    
    var body: some View {
        image.onChange(of: url) { newurl in
            if let updatedUrl = newurl, let url = URL(string: updatedUrl) {
                imageLoader.url = url
                imageLoader.loadImage()
            }
        }
    }
}
