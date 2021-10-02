//
//  NetworkError.swift
//  Pagination
//
//  Created by 김종권 on 2021/09/30.
//

import Foundation

enum NetworkError: LocalizedError {
    case unknownError
    case invalidHttpStatusCode(Int)
    case components
    case urlRequest(Error)
    case parsing(Error)
    case emptyData
    case decodeError

    var errorDescription: String? {
        switch self {
        case .unknownError: return "알수 없는 에러입니다."
        case .invalidHttpStatusCode: return "status코드가 200~299가 아닙니다."
        case .components: return "components를 생성 에러가 발생했습니다."
        case .urlRequest: return "URL request 관련 에러가 발생했습니다."
        case .parsing: return "데이터 parsing 중에 에러가 발생했습니다."
        case .emptyData: return "data가 비어있습니다."
        case .decodeError: return "decode 에러가 발생했습니다."
        }
    }
}
