//
//  PhotoViewController2.swift
//  Pagination
//
//  Created by 김종권 on 2021/10/02.
//

import Foundation
import UIKit

class PhotoViewController2: UIViewController {

    private let viewModel = PhotoViewModel2()

    private let searchEmptyView: SearchEmptyView = {
        return SearchEmptyView()
    }()

    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: view.bounds, collectionViewLayout: .leftThreeRightThree)
        view.delegate = self
        view.isPrefetchingEnabled = true
        view.prefetchDataSource = self
        view.alwaysBounceVertical = true
        view.backgroundColor = .white
        view.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)

        return view
    }()

    var photos = [Photo]()
    var provider: Provider? = ProviderImpl()
    var currentPage = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        addSubviews()
        setupCollectionView()
        setupSearchController()
        makeConstraints()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        DispatchQueue.main.async {
            self.navigationItem.searchController?.searchBar.searchTextField.becomeFirstResponder()
        }
    }

    private func setupViews() {
        view.backgroundColor = .white
        title = "photo search"
    }

    private func addSubviews() {
        view.addSubview(collectionView)
        view.addSubview(searchEmptyView)
    }

    private func setupCollectionView() {
        viewModel.dataSource = UICollectionViewDiffableDataSource<Section, Photo>(collectionView: collectionView,
                                                                                  cellProvider: { [weak self] collectionView, indexPath, photo in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath)
            (cell as? PhotoCollectionViewCell)?.model = photo
            self?.viewModel.loadImages(for: photo)

            return cell
        })
    }

    private func makeConstraints() {

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor)
        ])

        searchEmptyView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchEmptyView.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
            searchEmptyView.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
            searchEmptyView.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            searchEmptyView.topAnchor.constraint(equalTo: collectionView.topAnchor)
        ])
    }

    private func setupSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Search Photos, Journaling, growing ..."
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
}

extension PhotoViewController2: UICollectionViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentHeight = scrollView.contentSize.height
        let yOffset = scrollView.contentOffset.y
        let heightRemainFromBottom = contentHeight - yOffset

        let frameHeight = scrollView.frame.size.height
        if heightRemainFromBottom < frameHeight * 2.0 {
            viewModel.loadData()
        }
    }
}

extension PhotoViewController2: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        indexPaths.forEach { viewModel.prefetchImage(at: $0) }
    }
}

extension PhotoViewController2: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchEmptyView.isHidden = searchBar.text?.isEmpty == false
        viewModel.loadData(with: searchBar.text ?? "")
    }
}
