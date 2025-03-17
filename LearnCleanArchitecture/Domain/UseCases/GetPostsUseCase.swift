//
//  GetPostsUseCase.swift
//  LearnCleanArchitecture
//
//  Created by SeanCho on 3/13/25.
//

import Foundation

protocol GetPostsUseCase {
    func execute() async throws -> [Post]
}
