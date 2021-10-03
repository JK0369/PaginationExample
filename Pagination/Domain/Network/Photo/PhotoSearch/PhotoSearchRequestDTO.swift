//
//  PhotoSearchRequestDTO.swift
//  Pagination
//
//  Created by 김종권 on 2021/10/03.
//

import Foundation

enum OrientationType: String, Encodable {
    case landscape
    case portrait
    case squarish
}

struct PhotoSearchRequestDTO: Encodable {
    let query: String
    let page: Int
    var perPage: Int = 10
    var orderBy: OrderBy = .latest
    var orientation: OrientationType = .portrait

    enum CodingKeys: String, CodingKey {
        case query
        case page
        case perPage = "per_page"
        case orderBy = "order_by"
        case orientation = "orientation"
    }
}
