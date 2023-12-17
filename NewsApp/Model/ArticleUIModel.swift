//
//  ArticleUIModel.swift
//  NewsApp
//
//  Created by Bedirhan Turhan on 8.12.2023.
//

import SwiftUI

struct ArticleUIModel:  Hashable, Identifiable, Equatable {
    static func == (lhs: ArticleUIModel, rhs: ArticleUIModel) -> Bool {
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
    @State var saved: Bool = false
}
