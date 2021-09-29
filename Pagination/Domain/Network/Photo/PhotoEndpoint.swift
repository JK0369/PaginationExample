//
//  PhotoEndpoint.swift
//  Pagination
//
//  Created by 김종권 on 2021/09/30.
//

import Foundation

enum PhotoEndpoint {
    case photoList(PhotoListRequest)
}

extension PhotoEndpoint: Endpoint {

    var baseURL: String {
        switch self {
        case .photoList: return "https://api.unsplash.com/"
        }
    }

    var path: String {
        switch self {
        case .photoList: return ""
        }
    }

    var queryParameters: Encodable? {
        switch self {
        case .photoList(let request): return request
        }
    }

    var bodyParameters: Encodable? {
        switch self {
        case .photoList: return nil
        }
    }

    var method: HttpMethod {
        switch self {
        case .photoList: return .get
        }
    }

    var sampleData: Data {
        switch self {
        case .photoList: return """

                                """.data(using: .utf8)!
        }
    }

    var headers: [String : String]? {
        switch self {
        case .photoList:
            return ["client_id": Constants.accessKey,
                    "client_secret": Constants.secretKey]
        }
    }
}
