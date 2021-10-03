//
//  SearchEmptyView.swift
//  Pagination
//
//  Created by 김종권 on 2021/10/03.
//

import Foundation
import UIKit

class SearchEmptyView: BaseView<Void> {
    lazy var informationLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "검색창에서 키워드로\n사진을 검색해주세요."
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center

        return label
    }()

    override func configure() {
        super.configure()

        setupViews()
        addSubviews()
        makeConstraints()
    }

    private func setupViews() {
        backgroundColor = .white
    }

    private func addSubviews() {
        addSubview(informationLabel)
    }

    private func makeConstraints() {
        informationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            informationLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            informationLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            informationLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            informationLabel.topAnchor.constraint(equalTo: topAnchor)
        ])
    }
}
