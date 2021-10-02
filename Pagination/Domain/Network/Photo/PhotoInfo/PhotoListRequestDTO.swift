//
//  PhotoListRequest.swift
//  Pagination
//
//  Created by 김종권 on 2021/09/30.
//

import Foundation

enum OrderBy: String, Encodable {
    case latest
    case oldest
    case popular
}

struct PhotoListRequestDTO: Encodable {
    let page: Int
    var perPage: Int = 10
    var orderBy: OrderBy = .latest

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case orderBy = "order_by"
    }
}
