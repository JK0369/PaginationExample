//
//  Provider.swift
//  Pagination
//
//  Created by 김종권 on 2021/09/30.
//

import Foundation

protocol Requestable {
    var endPoint: Endpoint { get }

    func request(completion: @escaping (Result<Decodable, Error>) -> Void)
}

class Provider: Requestable {

    let endPoint: Endpoint

    let session: URLSession
    init(session: URLSession = .shared, endPoint: Endpoint) {
        self.session = session
        self.endPoint = endPoint
    }

    func request(completion: @escaping (Result<Decodable, Error>) -> Void) {

        // DataTask
        guard let urlRequest = try? getUrlRequest() else { return }

        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            completion(.success(data))
        }

        dataTask.resume()
    }
}

extension Requestable {

    func getUrlRequest() throws -> URLRequest {
        let url = try url()
        var urlRequest = URLRequest(url: url)

        // httpBody
        if let bodyParameters = try endPoint.bodyParameters?.toDictionary() {
            if !bodyParameters.isEmpty {
                urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: bodyParameters)
            }
        }

        // httpMethod
        urlRequest.httpMethod = endPoint.method.rawValue

        // header
        endPoint.headers?.forEach { urlRequest.setValue($1, forHTTPHeaderField: $0) }

        return urlRequest
    }

    private func url() throws -> URL {

        // baseURL + path
        let fullPath = "\(endPoint.baseURL)\(endPoint.path)"
        guard var urlComponents = URLComponents(string: fullPath) else { throw RequestError.components }

        // (baseURL + path) + queryParameters
        var urlQueryItems = [URLQueryItem]()
        if let queryParameters = try endPoint.queryParameters?.toDictionary() {
            queryParameters.forEach {
                urlQueryItems.append(URLQueryItem(name: $0.key, value: "\($0.value)"))
            }
        }
        urlComponents.queryItems = !urlQueryItems.isEmpty ? urlQueryItems : nil

        guard let url = urlComponents.url else { throw RequestError.components }
        return url
    }

}

extension Encodable {
    func toDictionary() throws -> [String: Any]? {
        let data = try JSONEncoder().encode(self)
        let jsonData = try JSONSerialization.jsonObject(with: data)
        return jsonData as? [String: Any]
    }
}
