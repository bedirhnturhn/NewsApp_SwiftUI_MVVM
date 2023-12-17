//
//  SavedNewsVM.swift
//  NewsApp
//
//  Created by Bedirhan Turhan on 17.12.2023.
//

import Foundation


final class SavedNewsVM: ObservableObject {
    
    @Published var savedNews: [ArticleUIModel] = []
    
    func fetchNews() {
        savedNews = NewsSavingManager.shared.getSavedNews()
    }
}


