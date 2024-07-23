//
//  AsyncImage.swift
//  Simple Chef
//
//  Created by James Charron on 7/23/24.
//

import SwiftUI

struct AsyncImage: View {
    @StateObject private var loader: ImageLoader
    var loading: Image
    var failure: Image

    init(url: URL?, loading: Image = Image(systemName: "photo"), failure: Image = Image(systemName: "multiply.circle")) {
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
        self.loading = loading
        self.failure = failure
    }

    var body: some View {
        selectImage()
            .onAppear(perform: loader.load)
    }

    private func selectImage() -> Image {
        switch loader.state {
        case .loading:
            return loading
        case .failure:
            return failure
        case .success(let image):
            return Image(uiImage: image)
        }
    }
}

final class ImageLoader: ObservableObject {
    enum State {
        case loading
        case failure
        case success(UIImage)
    }

    @Published var state = State.loading
    private let url: URL?

    init(url: URL?) {
        self.url = url
    }

    func load() {
        guard let url = url else {
            state = .failure
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.state = .success(image)
                }
            } else {
                DispatchQueue.main.async {
                    self.state = .failure
                }
            }
        }.resume()
    }
}
