//
//  SearchVM.swift
//  NewsApp
//
//  Created by Bedirhan Turhan on 19.11.2023.
//

import Foundation
import Combine

final class SearchVM: ObservableObject {
    
    @Published var searchQuery = ""
    @Published var fetchedNews: [ArticleUIModel]? = nil
    @Published var isSearching = false
    
    @Published var page = 1
    public let pageSize = 15
    
    
    var searchCancellable: AnyCancellable? = nil
    
    init () {
        searchCancellable = $searchQuery
            .removeDuplicates()
            .debounce(for: 0.6, scheduler: RunLoop.main)
            .sink(receiveValue: { str in
                if str == "" {
                    self.fetchedNews = nil
                } else if str.count >= 3 {
                    self.searchNews() 
                }
            })
    }
    
    func searchNews() {
        isSearching = true
        
        let originalQuery = searchQuery.replacingOccurrences (of: " ", with: "%20")
        let urlString = "https://newsapi.org/v2/everything?q=\(originalQuery)&page=\(page)&apiKey=\(AppConstants.apiKey)&pageSize=\(pageSize)"
        
        let session = URLSession(configuration: .default)
        
        guard let url = URL(string: urlString) else { return }
        
        session.dataTask(with: url) {[weak self] data, httpV, error in
            guard let self else { return }
            self.isSearching = false
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

