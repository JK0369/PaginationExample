//
//  Endpoint.swift
//  Pagination
//
//  Created by 김종권 on 2021/09/30.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol Endpoint {
    var baseURL: String { get }

    var path: String { get }

    var queryParameters: Encodable? { get }

    var bodyParameters: Encodable? { get }

    var method: HttpMethod { get }

    var headers: [String: String]? { get }

    var task: Task { get }

    var sampleData: Data { get }
}
