//
//  NewsListView.swift
//  NewsApp
//
//  Created by Bedirhan Turhan on 17.12.2023.
//

import SwiftUI

struct NewsListView: View {
    
    @EnvironmentObject var viewModel: NewsListVM
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .center, spacing: 12, content: {
                if viewModel.fetchedNews == nil, viewModel.isFetching {
                    VStack {
                        ProgressView()
                            .padding(20)
                        Text("Loading...")
                    }
                } else {
                    if let newsArray = viewModel.fetchedNews, newsArray.count > 0 {
                        VStack(alignment: .center, spacing: 12) {
                            ForEach(newsArray) { news in
                                NavigationLink {
                                    NewsDetailView(article: news, saved: news.saved)
                                } label: {
                                    NewsHomeRowView(article: news)
                                }
                            }
                            
                            if viewModel.pageSize * viewModel.page > viewModel.fetchedNews?.count ?? 0 {
                                ProgressView()
                                    .padding()
                            } else {
                                GeometryReader { reader -> Color in
                                    let minY = reader.frame(in: .global).minY
                                    let height = UIScreen.main.bounds.height / 1.3
                                    
                                    if minY < height,
                                       viewModel.pageSize * viewModel.page == viewModel.fetchedNews?.count ?? 0  {
                                        DispatchQueue.main.async {
                                            self.viewModel.page += 1
                                            viewModel.fetchNews()
                                        }
                                    }
                                    return Color.clear
                                }
                                .frame(width: 20, height: 20)
                            }
                        }.padding(10)
                    } else {
                        Text("Something went wrong, Please try again.")
                            .padding(.top, 20)
                    }
                }
            })
        }
        .onAppear(perform: {
            viewModel.fetchNews()
        })
    }
}

//#Preview {
//    NewsListView(, type: <#NewsCategories#>)
//}
