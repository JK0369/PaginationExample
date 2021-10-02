//
//  Photo.swift
//  Pagination
//
//  Created by 김종권 on 2021/09/30.
//

import Foundation
import UIKit

// 주의: Anyclass의 서브클래스만 가능
class Photo: Item {
    var image: UIImage
    var imageUrl: URL
    var identifier = UUID()

    init(image: UIImage, imageUrl: URL) {
        self.image = image
        self.imageUrl = imageUrl
    }
}

extension Photo: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }

    static func == (lhs: Photo, rhs: Photo) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
