//
//  PostsRepository.swift
//  LearnCleanArchitecture
//
//  Created by SeanCho on 3/13/25.
//

import Foundation

protocol PostsRepositoryProtocol {
    func getPosts() async throws -> [Post]
}

class PostsRepository: PostsRepositoryProtocol {
    private let remoteDataSource: RemotePostsDataSourceProtocol

    init(remoteDataSource: RemotePostsDataSourceProtocol = RemotePostsDataSource()) {
        self.remoteDataSource = remoteDataSource
    }

    func getPosts() async throws -> [Post] {
        let dtos = try await remoteDataSource.fetchPosts()
        return dtos.map { $0.toDomain() }
    }
}
