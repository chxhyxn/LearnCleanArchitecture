//
//  APIService.swift
//  LearnCleanArchitecture
//
//  Created by SeanCho on 3/13/25.
//

import Foundation

protocol APIServiceProtocol {
    func request<T: Decodable>(url: URL) async throws -> T
}

class APIService: APIServiceProtocol {
    func request<T: Decodable>(url: URL) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode(T.self, from: data)
    }
}
