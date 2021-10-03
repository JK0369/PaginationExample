//
//  BaseCollectionViewCell.swift
//  Pagination
//
//  Created by 김종권 on 2021/10/03.
//

import UIKit

class BaseCollectinoViewCell<M>: UICollectionViewCell {
    var model: M? {
        didSet {
            if let model = model {
                bind(model)
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        configure()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure() {}
    func bind(_ model: M) {}
}
