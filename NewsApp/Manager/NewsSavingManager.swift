//
//  NewsSavingManager.swift
//  NewsApp
//
//  Created by Bedirhan Turhan on 17.12.2023.
//

import Foundation

final class NewsSavingManager {
    
    static let shared = NewsSavingManager()
    private let savedNewsKey = "savedNews"
    private let userDefaults = UserDefaults.standard
    private var savedNewsArray = [ArticleUIModel]()
    
    private init() { }
    
    func getSavedNews() -> [ArticleUIModel] {
        updateNewsArray()
        return savedNewsArray
    }
    
    func isArticleSaved(article: ArticleUIModel) -> Bool {
        updateNewsArray()
        return savedNewsArray.filter({$0.url == article.url}).count > 0
    }
    
    func saveNews(article: ArticleUIModel) {
        updateNewsArray()
        savedNewsArray.append(article)
        let data = savedNewsArray.map { try? JSONEncoder().encode($0) }
        userDefaults.set(data, forKey: savedNewsKey)
    }
    
    func removeFromSavingList(article: ArticleUIModel) {
        updateNewsArray()
        for (index, articl) in savedNewsArray.enumerated() {
            if articl.url == article.url {
                savedNewsArray.remove(at: index)
                break
            }
        }
        let data = savedNewsArray.map { try? JSONEncoder().encode($0) }
        userDefaults.set(data, forKey: savedNewsKey)
    }
    
    private func updateNewsArray() {
        guard let encodedData = userDefaults.array(forKey: savedNewsKey) as? [Data] else {
            savedNewsArray = []
            return
        }
        do {
            savedNewsArray = try encodedData.map { try JSONDecoder().decode(ArticleUIModel.self, from: $0) }
        } catch {
            savedNewsArray = []
        }
    }
}
