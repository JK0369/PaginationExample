//
//  PhotoAPITests.swift
//  PaginationTests
//
//  Created by 김종권 on 2021/10/02.
//

import XCTest
@testable import Pagination

class PhotoAPITests: XCTestCase {

    var sut: Provider!

    override func setUpWithError() throws {
        // mock데이터 주입
        sut = ProviderImpl(session: MockURLSession())
    }

    func test_fetchPhotoList_whenSuccess_thenProcessRight() {
        // async테스트를 위해서 XCTestExpectation 사용
        let expectation = XCTestExpectation()

        let endpoint = APIEndpoints.getPhotosInfo(with: .init(page: 1))
        let responseMock = try? JSONDecoder().decode([PhotoListResponseDTO].self, from: endpoint.sampleData!)

        sut.request(with: endpoint) { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response.first?.id, responseMock?.first?.id)
            case .failure:
                XCTFail()
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }

    func test_fetchPhotoList_whenFailed_thenProcessRight() {
        sut = ProviderImpl(session: MockURLSession(makeRequestFail: true))
        let expectation = XCTestExpectation()

        let endpoint = APIEndpoints.getPhotosInfo(with: .init(page: 1))

        sut.request(with: endpoint) { result in
            switch result {
            case .success:
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, "status코드가 200~299가 아닙니다.")
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }
}
