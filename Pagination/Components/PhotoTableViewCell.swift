//
//  PhotoTableViewCell.swift
//  Pagination
//
//  Created by 김종권 on 2021/09/30.
//

import UIKit

class PhotoTableViewCell: BaseTableViewCell<Photo> {

    static let identifier = "PhotoTableViewCell"

    lazy var photoImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill

        return view
    }()

    override func configure() {
        super.configure()

        addSubviews()
        makeConstraints()
    }

    private func addSubviews() {
        contentView.addSubview(photoImageView)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.preservesSuperviewLayoutMargins = false
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
        photoImageView.sizeToFit()
    }

}
