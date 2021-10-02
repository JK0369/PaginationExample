//
//  PhotoViewModel.swift
//  Pagination
//
//  Created by 김종권 on 2021/10/02.
//

import Foundation
import UIKit

enum Section: Int, CaseIterable {
    case main
}

class PhotoViewModel {
    var currentPage: Int = 0
    var dataSource: UITableViewDiffableDataSource<Section, Photo>!
    lazy var provider: Provider = ProviderImpl()
    lazy var imageCache = ImageCache(provider: provider)

    // Load data

    func loadData() {
        currentPage += 1

        let photoListRequestDTO = PhotoListRequestDTO(page: currentPage)
        let endpoint = APIEndpoints.getPhotosInfo(with: photoListRequestDTO)

        provider.request(with: endpoint, completion: { [weak self] result in
            guard let weakSelf = self else { return }

            switch result {
            case .success(let responseDTOs):
                var snapshot = weakSelf.dataSource.snapshot()
                if snapshot.sectionIdentifiers.isEmpty {
                    snapshot.appendSections([.main])
                }
                var newPhotos = [Photo]()
                responseDTOs.forEach{ newPhotos.append($0.toDomain()) }
                snapshot.appendItems(newPhotos)

                DispatchQueue.global(qos: .background).async {
                    weakSelf.dataSource.apply(snapshot, animatingDifferences: false)
                }

            case .failure(let error):
                print(error)
            }
        })

    }

    // prefetch

    func prefetchImage(at indexPath: IndexPath) {
        guard let photo = dataSource.itemIdentifier(for: indexPath) else {
            return
        }

        imageCache.prefetchImage(for: photo)
    }

    // load image

    func loadImages(for photo: Photo) {

        imageCache.loadImage(for: photo) { [weak self] item, image in
            guard let `self` = self else { return }
            guard let photo = item as? Photo else { return }
            guard let image = image, image != photo.image else { return }

            photo.image = image
            var snapshot = `self`.dataSource.snapshot()
            guard snapshot.indexOfItem(photo) != nil else { return }

            snapshot.reloadItems([photo])
            DispatchQueue.global(qos: .background).async {
                `self`.dataSource.apply(snapshot, animatingDifferences: false)
            }
        }
    }
}
