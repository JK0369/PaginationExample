//
//  ImageCache.swift
//  Pagination
//
//  Created by 김종권 on 2021/10/02.
//

import Foundation
import UIKit

protocol Item {
    var image: UIImage { get set }
    var imageUrl: URL { get }
    var identifier: UUID { get }
}

typealias ImageCompletion = (Item, UIImage?) -> Void

class ImageCache {
    let provider: Provider
    init(provider: Provider) {
        self.provider = provider
    }

    private let cache = NSCache<NSURL, UIImage>()
    private var prefetches: [UUID] = []
    private var completions: [NSURL: [ImageCompletion]]? = [:]

    // Prefetch

    func prefetchImage(for item: Item) {
        let url = item.imageUrl as NSURL
        guard cachedImage(for: url) == nil, !prefetches.contains(item.identifier) else { return }
        prefetches.append(item.identifier)

        provider.request(item.imageUrl) { [weak self] result in
            switch result {
            case .success(let data):
                guard let image = UIImage(data: data) else { return }
                self?.cache.setObject(image, forKey: url)
                self?.prefetches.removeAll { $0 == item.identifier }
            default: break
            }
        }
    }

    // Load

    func loadImage(for item: Item, completion: @escaping ImageCompletion) {
        let url = item.imageUrl as NSURL
        if let image = cachedImage(for: url) {
            completion(item, image)
            return
        }

        if completions?[url] != nil {
            completions?[url]?.append(completion)
            return
        } else {
            completions?[url] = [completion]
        }

        provider.request(item.imageUrl) { [weak self] result in
            switch result {
            case .success(let data):
                guard let image = UIImage(data: data) else { return }

                guard let completions = self?.completions?[url] else {
                    completion(item, nil)
                    return
                }

                self?.cache.setObject(image, forKey: url)

                completions.forEach { completion in
                    completion(item, image)
                }
            case .failure(let error):
                print(error)
                completion(item, nil)
            }

            self?.completions?.removeValue(forKey: url)
        }
    }

    // Reset

    func reset() {
        completions?.removeAll()
        prefetches.removeAll()
        cache.removeAllObjects()
    }

    // Cache

    private func cachedImage(for url: NSURL) -> UIImage? {
        cache.object(forKey: url)
    }
}
