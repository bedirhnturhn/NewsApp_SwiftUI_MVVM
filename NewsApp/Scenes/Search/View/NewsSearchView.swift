//
//  NewsSearchView.swift
//  NewsApp
//
//  Created by Bedirhan Turhan on 18.11.2023.
//

import SwiftUI

struct NewsSearchView: View {
    @EnvironmentObject var viewModel: SearchVM
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 12) {
                HStack(spacing: 10) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search", text: $viewModel.searchQuery)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(Color.white)
                .clipShape(Capsule())
                .padding(.horizontal, 25)
                .shadow(color: Color.black.opacity(0.08), radius: 5, x: 5, y: 5)
                .shadow(color: Color.black.opacity(0.08), radius: 5, x: -5, y: -5)
                .padding(.top)
                
                if viewModel.searchQuery.count >= 3 {
                    if viewModel.isSearching, viewModel.fetchedNews?.isEmpty ?? true {
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
                                        
                                        if minY < height, viewModel.pageSize * viewModel.page == viewModel.fetchedNews?.count ?? 0  {
                                            DispatchQueue.main.async {
                                                self.viewModel.page += 1
                                                viewModel.searchNews()
                                            }
                                        }
                                        return Color.clear
                                    }
                                    .frame(width: 20, height: 20)
                                }
                            }.padding(10)
                        } else {
                            Text("No Result Found.")
                                .padding(.top, 20)
                        }
                    }
                } else {
                    LazyVGrid(columns: columns,spacing: 24) {
                        ForEach(NewsCategories.allCases.indices) { index in
                            NavigationLink {
                                NewsListView()
                                    .environmentObject(NewsListVM(category: NewsCategories.allCases[index]))
                                    .navigationTitle(NewsCategories.allCases[index].title)
                            } label: {
                                NewsCategoryView(category: NewsCategories.allCases[index])
                            }
                        }
                    }
                    .padding(.vertical, 24)
                }
            }
        }
    }
}

struct NewsSearchView_Previews: PreviewProvider {
    static var previews: some View {
        NewsSearchView()
            .environmentObject(SearchVM())
    }
}
