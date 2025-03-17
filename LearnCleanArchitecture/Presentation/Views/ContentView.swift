//
//  ContentView.swift
//  LearnCleanArchitecture
//
//  Created by SeanCho on 3/13/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PostsViewModel()

    var body: some View {
        NavigationStack {
            Group {
                if let error = viewModel.errorMessage {
                    Text("Error: \(error)")
                        .foregroundStyle(.red)
                } else {
                    List(viewModel.posts) { post in
                        VStack(alignment: .leading, spacing: 5) {
                            Text(post.title)
                                .font(.headline)
                            Text(post.body)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        .padding(5)
                    }
                }
            }
            .navigationTitle("Posts")
            .task {
                viewModel.loadPosts()
            }
        }
    }
}
