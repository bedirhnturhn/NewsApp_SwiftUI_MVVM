//
//  NewsListVM.swift
//  NewsApp
//
//  Created by Bedirhan Turhan on 17.12.2023.
//

import Foundation
import Combine

final class NewsListVM: ObservableObject {
    
    @Published var fetchedNews: [ArticleUIModel]? = nil
    let category: NewsCategories
    @Published var isFetching = false
    @Published var page = 1
    public let pageSize = 15
    
    init(category: NewsCategories) {
        self.category = category
    }
    
    func fetchNews() {
        isFetching = true
        
        let urlString = "https://newsapi.org/v2/top-headlines?country=\(AppConstants.country)&category=\(category.title.lowercased())&page=\(page)&pageSize=\(pageSize)&apiKey=\(AppConstants.apiKey)"
        
        let session = URLSession(configuration: .default)
        
        guard let url = URL(string: urlString) else { return }
        
        session.dataTask(with: url) {[weak self] data, httpV, error in
            guard let self else { return }
            self.isFetching = false
            if let error {
                print(error.localizedDescription)
                return
            }
            
            guard let data else { print("no data"); return }
            
            do{
                //decoding API data
                let news = try JSONDecoder().decode(News.self, from: data)
                
                DispatchQueue.main.async { [weak self] in
                    guard let self, let articles = news.articles else { return }
                    if self.fetchedNews == nil {
                        self.fetchedNews = articles.convertToUIModel()
                    } else {
                        self.fetchedNews?.append(contentsOf: articles.convertToUIModel())
                    }
                }
            }
            catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
}

