//
//  RequestError.swift
//  Pagination
//
//  Created by 김종권 on 2021/09/30.
//

import Foundation

enum RequestError: LocalizedError {
    case components

    var errorDescription: String? {
        switch self {
        case .components: return "components를 생성 에러가 발생했습니다."
        }
    }
}
