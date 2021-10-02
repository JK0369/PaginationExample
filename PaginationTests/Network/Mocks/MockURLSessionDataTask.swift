//
//  MockURLSessionDataTask.swift
//  PaginationTests
//
//  Created by 김종권 on 2021/10/02.
//

import Foundation

class MockURLSessionDataTask: URLSessionDataTask {

    var resumeDidCall: (() -> ())?

    override func resume() {
        // 주의: super.resume()호출하면 실제 resume()이 호출되므로 주의
        resumeDidCall?()
    }
}
