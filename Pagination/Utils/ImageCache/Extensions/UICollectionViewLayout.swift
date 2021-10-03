//
//  UICollectionViewLayout.swift
//  Pagination
//
//  Created by 김종권 on 2021/10/03.
//

import UIKit

extension UICollectionViewLayout {

    // Grid

    static let grid = UICollectionViewCompositionalLayout { section, environment in
        let margin = 1.0
        let numberOfColumn = 2

        // group에 item의 비율을 어떻게 채울 것인가
        // ex) .fractionalHeight(0.5): group의 높이에 대해 0.5만큼만 차지 (높이 여백 생성)
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: margin,
                                                     leading: margin,
                                                     bottom: margin,
                                                     trailing: margin)

        // Section에 group의 비율을 어떻게 채울 것인가
        // cell 컨텐츠의 크기를 줄이고 싶은 경우, item에서 조정하는게 아닌 group에서 조정하는것을 주의
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitem: item,
                                                       count: numberOfColumn)

        let section = NSCollectionLayoutSection(group: group)

        return section
    }

    // leftOneRightThree

    static let leftOneRightThree = UICollectionViewCompositionalLayout { section, environment in

        let margin = 1.0

        // 좌측 그룹
        let leadingItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                     heightDimension: .fractionalHeight(1.0))
        let leadingItem = NSCollectionLayoutItem(layoutSize: leadingItemSize)
        leadingItem.contentInsets = NSDirectionalEdgeInsets(top: margin,
                                                            leading: margin,
                                                            bottom: margin,
                                                            trailing: margin)

        let leadingGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                                      heightDimension: .fractionalHeight(1.0))
        let leadingGroup = NSCollectionLayoutGroup.vertical(layoutSize: leadingGroupSize,
                                                            subitem: leadingItem,
                                                            count: 1)

        // 우측 그룹
        let trailingItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .fractionalHeight(1.0))
        let trailingItem = NSCollectionLayoutItem(layoutSize: trailingItemSize)
        trailingItem.contentInsets = NSDirectionalEdgeInsets(top: margin,
                                                            leading: margin,
                                                            bottom: margin,
                                                            trailing: margin)

        let trailingGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                                       heightDimension: .fractionalHeight(1.0))
        let trailingGroup = NSCollectionLayoutGroup.vertical(layoutSize: trailingGroupSize,
                                                             subitem: trailingItem,
                                                             count: 3)

        // 좌측 그룹과 우측 그룹을 포함하는 그룹
        let containerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                        heightDimension: .fractionalHeight(0.6))
        let containerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: containerGroupSize,
                                                                subitems: [leadingGroup, trailingGroup])

        let section = NSCollectionLayoutSection(group: containerGroup)
        return section
    }

    // leftThreeRightThree

    static let leftThreeRightThree = UICollectionViewCompositionalLayout { section, environment in

        let margin = 2.0

        // 좌측 그룹

        /// first item
        let leadingFirstItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                          heightDimension: .fractionalHeight(0.35))
        let leadingFirstItem = NSCollectionLayoutItem(layoutSize: leadingFirstItemSize)
        leadingFirstItem.contentInsets = NSDirectionalEdgeInsets(top: margin, leading: margin, bottom: margin, trailing: margin)

        /// second item
        let leadingSecondItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                           heightDimension: .fractionalHeight(0.2))
        let leadingSecondItem = NSCollectionLayoutItem(layoutSize: leadingSecondItemSize)
        leadingSecondItem.contentInsets = NSDirectionalEdgeInsets(top: margin, leading: margin, bottom: margin, trailing: margin)

        /// third item
        let leadingThirdItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                           heightDimension: .fractionalHeight(0.45))
        let leadingThirdItem = NSCollectionLayoutItem(layoutSize: leadingThirdItemSize)
        leadingThirdItem.contentInsets = NSDirectionalEdgeInsets(top: margin, leading: margin, bottom: margin, trailing: margin)

        /// leading group
        let leadingGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                                      heightDimension: .fractionalHeight(1.0))
        let leadingGroup = NSCollectionLayoutGroup.vertical(layoutSize: leadingGroupSize,
                                                            subitems: [leadingFirstItem, leadingSecondItem, leadingThirdItem])

        // 우측 그룹
        /// first item
        let trailingFirstItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                           heightDimension: .fractionalHeight(0.5))
        let trailingFirstItem = NSCollectionLayoutItem(layoutSize: trailingFirstItemSize)
        trailingFirstItem.contentInsets = NSDirectionalEdgeInsets(top: margin, leading: margin, bottom: margin, trailing: margin)

        /// second item
        let trailingSecondItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                           heightDimension: .fractionalHeight(0.2))
        let trailingSecondItem = NSCollectionLayoutItem(layoutSize: trailingSecondItemSize)
        trailingSecondItem.contentInsets = NSDirectionalEdgeInsets(top: margin, leading: margin, bottom: margin, trailing: margin)

        /// third item
        let trailingThirdItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                           heightDimension: .fractionalHeight(0.3))
        let trailingThirdItem = NSCollectionLayoutItem(layoutSize: trailingThirdItemSize)
        trailingThirdItem.contentInsets = NSDirectionalEdgeInsets(top: margin, leading: margin, bottom: margin, trailing: margin)

        /// trailing group
        let trailingGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                                       heightDimension: .fractionalHeight(1.0))
        let trailingGroup = NSCollectionLayoutGroup.vertical(layoutSize: trailingGroupSize,
                                                             subitems: [trailingFirstItem, trailingSecondItem, trailingThirdItem])

        /// margin
        [trailingFirstItem, trailingSecondItem, trailingThirdItem].forEach {
            $0.contentInsets = NSDirectionalEdgeInsets(top: margin, leading: margin, bottom: margin, trailing: margin)
        }

        // 좌측 그룹과 우측 그룹을 포함하는 그룹
        let containerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                        heightDimension: .fractionalHeight(1.0))
        let containerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: containerGroupSize,
                                                                subitems: [leadingGroup, trailingGroup])

        let section = NSCollectionLayoutSection(group: containerGroup)
        return section
    }
}
