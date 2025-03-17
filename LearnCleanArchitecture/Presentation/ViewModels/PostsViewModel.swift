//
//  PostsViewModel.swift
//  LearnCleanArchitecture
//
//  Created by SeanCho on 3/13/25.
//

import SwiftUI

@MainActor
class PostsViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var errorMessage: String?

    private let getPostsUseCase: GetPostsUseCase

    init(getPostsUseCase: GetPostsUseCase = DefaultGetPostsUseCase()) {
        self.getPostsUseCase = getPostsUseCase
    }

    func loadPosts() {
        Task {
            do {
                posts = try await getPostsUseCase.execute()
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }
}

struct DefaultGetPostsUseCase: GetPostsUseCase {
    private let repository: PostsRepositoryProtocol

    init(repository: PostsRepositoryProtocol = PostsRepository()) {
        self.repository = repository
    }

    func execute() async throws -> [Post] {
        try await repository.getPosts()
    }
}
