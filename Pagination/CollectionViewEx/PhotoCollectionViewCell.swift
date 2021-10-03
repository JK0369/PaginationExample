//
//  PhotoCollectionViewCell.swift
//  Pagination
//
//  Created by 김종권 on 2021/10/03.
//

import Foundation
import UIKit

class PhotoCollectionViewCell: BaseCollectinoViewCell<Photo> {

    static let identifier = String(describing: PhotoCollectionViewCell.self)

    private lazy var placeholderImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "photo", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .bold))
        view.contentMode = .scaleToFill
        view.clipsToBounds = true

        return view
    }()

    private let photoImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        view.clipsToBounds = true

        return view
    }()

    override func configure() {
        super.configure()

        addSubviews()
        makeConstraints()
    }

    private func addSubviews() {
        contentView.addSubview(placeholderImageView)
        contentView.addSubview(photoImageView)
    }

    private func makeConstraints() {
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
        ])
    }

    override func bind(_ model: Photo) {
        super.bind(model)

        photoImageView.image = model.image
    }
}
