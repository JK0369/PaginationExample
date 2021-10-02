//
//  MockURLSession.swift
//  PaginationTests
//
//  Created by 김종권 on 2021/10/02.
//

import Foundation
@testable import Pagination

class MockURLSession: URLSessionable {

    var makeRequestFail = false
    init(makeRequestFail: Bool = false) {
        self.makeRequestFail = makeRequestFail
    }

    var sessionDataTask: MockURLSessionDataTask?

    func dataTask(with request: URLRequest,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {

        let endpoint = APIEndpoints.getPhotosInfo(with: .init(page: 1))

        // 성공 callback
        let successResponse = HTTPURLResponse(url: try! endpoint.url(),
                                              statusCode: 200,
                                              httpVersion: "2",
                                              headerFields: nil)
        // 실패 callback
        let failureResponse = HTTPURLResponse(url: try! endpoint.url(),
                                              statusCode: 301,
                                              httpVersion: "2",
                                              headerFields: nil)

        let sessionDataTask = MockURLSessionDataTask()

        // resume() 이 호출되면 completionHandler()가 호출
        sessionDataTask.resumeDidCall = {
            if self.makeRequestFail {
                completionHandler(nil, failureResponse, nil)
            } else {
                completionHandler(endpoint.sampleData!, successResponse, nil)
            }
        }
        self.sessionDataTask = sessionDataTask
        return sessionDataTask
    }

    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let endpoint = APIEndpoints.getImages(with: "https://pixabay.com/ko/photos/%ea%b8%b0%eb%91%a5-%ec%bb%a4%ed%94%8c-%ec%82%ac%eb%9e%8c%eb%93%a4-%ea%b1%b4%ec%b6%95%eb%ac%bc-5747584/")

        // 성공 callback
        let successResponse = HTTPURLResponse(url: try! endpoint.url(),
                                              statusCode: 200,
                                              httpVersion: "2",
                                              headerFields: nil)
        // 실패 callback
        let failureResponse = HTTPURLResponse(url: try! endpoint.url(),
                                              statusCode: 301,
                                              httpVersion: "2",
                                              headerFields: nil)

        let sessionDataTask = MockURLSessionDataTask()

        // resume() 이 호출되면 completionHandler()가 호출
        sessionDataTask.resumeDidCall = {
            if self.makeRequestFail {
                completionHandler(nil, failureResponse, nil)
            } else {
                completionHandler(endpoint.sampleData!, successResponse, nil)
            }
        }
        self.sessionDataTask = sessionDataTask
        return sessionDataTask
    }
}
