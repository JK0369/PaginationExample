//
//  URLSessionable.swift
//  Pagination
//
//  Created by 김종권 on 2021/09/30.
//

import Foundation

/// URLSession 테스트를 위한 protocol (Provider 생성자에서 해당 인터페이스 참조)
protocol URLSessionable {
    func dataTask(with request: URLRequest,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
    func dataTask(with url: URL,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionable {}
