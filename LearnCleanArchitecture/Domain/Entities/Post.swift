//
//  Post.swift
//  LearnCleanArchitecture
//
//  Created by SeanCho on 3/13/25.
//

import Foundation

struct Post: Identifiable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}
