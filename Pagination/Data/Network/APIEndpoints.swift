//
//  APIEndpoints.swift
//  Pagination
//
//  Created by 김종권 on 2021/09/30.
//

import Foundation

struct APIEndpoints {
    static func getPhotosInfo(with photoListRequestDTO: PhotoListRequestDTO) -> Endpoint<[PhotoListResponseDTO]> {
        return Endpoint(baseURL: "https://api.unsplash.com/",
                        path: "photos",
                        method: .get,
                        queryParameters: photoListRequestDTO,
                        headers: ["Authorization": "Client-ID \(Constants.accessKey)"],
                        sampleData: NetworkResponseMock.photoList)
    }

    static func getImages(with url: String) -> Endpoint<Data> {
        return Endpoint(baseURL: url, sampleData: NetworkResponseMock.image)
    }
}
