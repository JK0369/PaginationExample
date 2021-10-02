//
//  BaseTableViewCell.swift
//  Pagination
//
//  Created by 김종권 on 2021/09/30.
//

import UIKit

class BaseTableViewCell<M>: UITableViewCell {
    var model: M? {
        didSet {
            if let model = model {
                bind(model)
            }
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configure()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure() {}
    func bind(_ model: M) {}
}
