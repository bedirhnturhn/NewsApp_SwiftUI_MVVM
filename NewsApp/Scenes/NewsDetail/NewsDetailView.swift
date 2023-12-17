//
//  NewsDetailView.swift
//  NewsApp
//
//  Created by Bedirhan Turhan on 17.12.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsDetailView: View {
    
    var article: ArticleUIModel
    @State var saved = false
    
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 12,
            content: {
                WebImage(url: URL(string: article.urlToImage ?? ""))
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: 250)
                Text(article.title ?? .empty)
                    .fontWeight(.bold)
                    .font(.title2)
                    .padding([.top, .leading, .trailing])
                Text(article.description ?? .empty)
                    .padding(.horizontal)
                    .padding(.top, 24)
                Spacer()
                Button(action: {
                    saved.toggle()
                    article.saved = saved
                    if saved {
                        NewsSavingManager.shared.saveNews(article: article)
                    } else {
                        NewsSavingManager.shared.removeFromSavingList(article: article)
                    }
                    // TODO: add saving news action
                }) {
                    HStack {
                        if saved {
                            Text("SAVED")
                            Spacer()
                            Image(systemName: "bookmark.fill")
                        } else {
                            Text("SAVE")
                            Spacer()
                            Image(systemName: "bookmark")
                        }
                    }
                    .padding()
                    .accentColor(.white)
                    .background(Color.mainBlue)
                    .clipShape(RoundedRectangle(cornerRadius: 14.0, style: .continuous))
                }
                .frame(maxWidth: UIScreen.main.bounds.width)
                .padding()
                NavigationLink {
                    if let urlString = article.url, let url = URL(string: urlString) {
                        WebView(url: url)
                            .navigationTitle("News Details")
                    }
                } label: {
                    HStack {
                        Text("GO TO DETAILS")
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding()
                    .accentColor(.white)
                    .background(Color.mainBlue)
                    .clipShape(RoundedRectangle(cornerRadius: 14.0, style: .continuous))
                }
                .frame(maxWidth: UIScreen.main.bounds.width)
                .padding([.horizontal, .bottom])
        })
        .onAppear(perform: {
            saved = NewsSavingManager.shared.isArticleSaved(article: article)
        })
    }
}
    
