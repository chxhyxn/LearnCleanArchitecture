//
//  RemotePostsDataSource.swift
//  LearnCleanArchitecture
//
//  Created by SeanCho on 3/13/25.
//

import Foundation

protocol RemotePostsDataSourceProtocol {
    func fetchPosts() async throws -> [PostDTO]
}

// DTO: Data Transfer Object (Codable)
struct PostDTO: Codable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
    
    // DTO -> Domain Entity 변환
    func toDomain() -> Post {
        Post(id: id, userId: userId, title: title, body: body)
    }
}

class RemotePostsDataSource: RemotePostsDataSourceProtocol {
    private let apiService: APIServiceProtocol
    private let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!

    init(apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }

    func fetchPosts() async throws -> [PostDTO] {
        try await apiService.request(url: url)
    }
}
