//
//  ViewController.swift
//  Pagination
//
//  Created by 김종권 on 2021/09/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private let viewModel = PhotoViewModel()

    var photos = [Photo]()
    var provider: Provider? = ProviderImpl()
    var currentPage = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupTableView()
    }

    private func setupViews() {
        view.backgroundColor = .white
        title = "photos"
    }

    private func setupTableView() {

        tableView.isPrefetchingEnabled = true
        tableView.prefetchDataSource = self
        tableView.delegate = self
        tableView.layoutMargins = .zero
        tableView.separatorColor = .black
        tableView.register(PhotoTableViewCell.self, forCellReuseIdentifier: PhotoTableViewCell.identifier)

        viewModel.dataSource = UITableViewDiffableDataSource<Section, Photo>(tableView: tableView, cellProvider: { [weak self] tableView, indexPath, photo in
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.identifier, for: indexPath)

            self?.viewModel.loadImages(for: photo)
            (cell as? PhotoTableViewCell)?.model = photo

            return cell
        })

        viewModel.loadData()
    }
}

extension ViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentHeight = scrollView.contentSize.height
        let yOffset = scrollView.contentOffset.y
        let heightRemainFromBottom = contentHeight - yOffset

        let frameHeight = scrollView.frame.size.height
        if heightRemainFromBottom < frameHeight {
            viewModel.loadData()
        }
    }
}

extension ViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        indexPaths.forEach { viewModel.prefetchImage(at: $0) }
    }
}
