//
//  NewsHomeVM.swift
//  NewsApp
//
//  Created by Bedirhan Turhan on 12.11.2023.
//

import Foundation

final class NewsHomeVM: ObservableObject {
    @Published var breakingNews: [ArticleUIModel] = []
    @Published var recommendationNews: [ArticleUIModel] = []
    @Published var offsetRecommendationNews: [ArticleUIModel] = []
    
    init() { }
    
    func fetchNews() {
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(AppConstants.apiKey)"
        let session = URLSession(configuration: .default)
        
        guard let url = URL(string: urlString) else { return } // TODO: add fail case
        
        session.dataTask(with: URLRequest(url: url, timeoutInterval: 25)) { data, response, error in
            if let error {
                print(error.localizedDescription)
                return
            }
            
            guard let data else{
                print ("no data found" )
                return
            }
            do{
                //decoding API data
                let news = try JSONDecoder().decode(News.self, from: data)
                
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    self.breakingNews = news.articles?.convertToUIModel() ?? []
                }
                
            }
            catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func fetchRecommendationNews() {
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(AppConstants.apiKey)&pageSize=20&page=2"
        let session = URLSession(configuration: .default)
        
        guard let url = URL(string: urlString) else { return } // TODO: add fail case
        
        session.dataTask(with: URLRequest(url: url, timeoutInterval: 25)) { data, response, error in
            if let error {
                print(error.localizedDescription)
                return
            }
            
            guard let data else{
                print ("no data found" )
                return
            }
            do{
                //decoding API data
                let news = try JSONDecoder().decode(News.self, from: data)
                
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    self.recommendationNews = news.articles?.convertToUIModel() ?? []
                }
                
            }
            catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
}
