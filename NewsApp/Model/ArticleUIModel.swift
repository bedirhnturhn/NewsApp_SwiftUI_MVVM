//
//  ArticleUIModel.swift
//  NewsApp
//
//  Created by Bedirhan Turhan on 8.12.2023.
//

import SwiftUI

class ArticleUIModel: Codable, Hashable, Identifiable, Equatable {
    static func == (lhs: ArticleUIModel, rhs: ArticleUIModel) -> Bool {
        return lhs.id == rhs.id
    }
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    init(
        source: Source? = nil,
        author: String? = nil,
        title: String? = nil,
        description: String? = nil,
        url: String? = nil,
        urlToImage: String? = nil,
        publishedAt: String? = nil,
        content: String? = nil
    ) {
        self.source = source
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
    }
    
    var id = UUID().uuidString
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    var saved: Bool = false
}
