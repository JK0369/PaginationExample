//
//  Requestable.swift
//  Pagination
//
//  Created by 김종권 on 2021/09/30.
//

import Foundation

protocol Requestable {
    var baseURL: String { get }
    var path: String { get }
    var method: HttpMethod { get }
    var queryParameters: Encodable? { get }
    var bodyParameters: Encodable? { get }
    var headers: [String: String]? { get }
    var sampleData: Data? { get }
}

extension Requestable {
    func getUrlRequest() throws -> URLRequest {
        let url = try url()
        var urlRequest = URLRequest(url: url)

        // httpBody
        if let bodyParameters = try bodyParameters?.toDictionary() {
            if !bodyParameters.isEmpty {
                urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: bodyParameters)
            }
        }

        // httpMethod
        urlRequest.httpMethod = method.rawValue

        // header
        headers?.forEach { urlRequest.setValue($1, forHTTPHeaderField: $0) }

        return urlRequest
    }

    func url() throws -> URL {

        // baseURL + path
        let fullPath = "\(baseURL)\(path)"
        guard var urlComponents = URLComponents(string: fullPath) else { throw NetworkError.components }

        // (baseURL + path) + queryParameters
        var urlQueryItems = [URLQueryItem]()
        if let queryParameters = try queryParameters?.toDictionary() {
            queryParameters.forEach {
                urlQueryItems.append(URLQueryItem(name: $0.key, value: "\($0.value)"))
            }
        }
        urlComponents.queryItems = !urlQueryItems.isEmpty ? urlQueryItems : nil

        guard let url = urlComponents.url else { throw NetworkError.components }
        return url
    }
}
