//
//  PhotoSearchResponseDTO.swift
//  Pagination
//
//  Created by 김종권 on 2021/10/03.
//

import Foundation
import UIKit

// MARK: - usernameWelcome
struct PhotoSearchResponseDTO: Decodable {
    let total: Int
    let totalPages: Int
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
    }

    struct Result: Decodable {
        let user: User
        let urls: Urls

        struct User: Decodable {
            let username: String
        }

        struct Urls: Decodable {
            let small: String
        }
    }
}

extension PhotoSearchResponseDTO {
    func toDomain() -> [Photo] {
        var photos = [Photo]()
        results.forEach { result in
            let photo = Photo(image: UIImage(systemName: "square")!, imageUrl: URL(string: result.urls.small)!)
            photos.append(photo)
        }
        return photos
    }
}
