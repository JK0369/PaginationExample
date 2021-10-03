//
//  PhotoViewModel2.swift
//  Pagination
//
//  Created by 김종권 on 2021/10/03.
//

import Foundation
import UIKit

enum ViewState {
    case idle
    case isLoding
}

class PhotoViewModel2 {
    var currentPage: Int = 0
    var dataSource: UICollectionViewDiffableDataSource<Section, Photo>!
    lazy var provider: Provider = ProviderImpl()
    lazy var imageCache = ImageCache(provider: provider)
    var query = ""
    var viewState = ViewState.idle

    // Load data
    func loadData(with query: String = "") {
        guard viewState == .idle else { return }
        guard let searchQuery = getSearchQuery(compared: query) else { return }
        self.query = searchQuery

        currentPage += 1
        let photoSearchRequestDTO = PhotoSearchRequestDTO(query: searchQuery, page: currentPage)
        let endpoint = APIEndpoints.getSearchingPhotos(with: photoSearchRequestDTO)

        viewState = .isLoding
        provider.request(with: endpoint, completion: { [weak self] result in
            guard let weakSelf = self else { return }
            self?.viewState = .idle

            switch result {
            case .success(let responseDTO):
                var snapshot = weakSelf.dataSource.snapshot()
                if snapshot.sectionIdentifiers.isEmpty {
                    snapshot.appendSections([.main])
                }
                snapshot.appendItems(responseDTO.toDomain())
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

    // Private

    private func getSearchQuery(compared query: String) -> String? {
        let searchQuery = query.isEmpty ? self.query : query
        return searchQuery.isEmpty ? nil : searchQuery
    }

}
