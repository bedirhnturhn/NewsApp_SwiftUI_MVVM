//
//  NewsModel.swift
//  NewsApp
//
//  Created by Bedirhan Turhan on 21.10.2023.
//

import Foundation

// MARK: - News
struct News: Codable {
    let status: String?
    let code: String?
    let message: String?
    let totalResults: Int?
    let articles: [Article]?
}

// MARK: - Article
struct Article: Codable, Hashable, Identifiable, Equatable {
    static func == (lhs: Article, rhs: Article) -> Bool {
        return lhs.id == rhs.id
    }
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    let id = UUID().uuidString
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String?
}
