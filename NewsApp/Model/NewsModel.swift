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
struct Article: Codable {
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

extension [Article] {
    func convertToUIModel() -> [ArticleUIModel] {
        self.map({ ArticleUIModel(
            source: $0.source,
            author: $0.author,
            title: $0.title,
            description: $0.description,
            url: $0.url,
            urlToImage: $0.urlToImage,
            publishedAt: $0.publishedAt,
            content: $0.content) })
    }
}
