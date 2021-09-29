//
//  APIError.swift
//  Pagination
//
//  Created by 김종권 on 2021/09/30.
//

import Foundation

enum APIError: LocalizedError {
    case unknownError

    var errorDescription: String? {
        switch self {
        case .unknownError: return "알수 없는 에러입니다."
        }
    }
}
