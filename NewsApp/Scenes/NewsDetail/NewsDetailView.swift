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
                    // TODO: add saving news action
                }) {
                    HStack {
                        Text("SAVE")
                        Spacer()
                        if saved {
                            Image(systemName: "bookmark.fill")
                        } else {
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
    }
}

#Preview {
    NewsDetailView(article: .init(source: nil, author: nil, title: "​Elon Musk: Inclusion, diversity and equity are 'propaganda words'", description: "​Elon Musk on Friday evening criticized diversity, equity and inclusion as \"propaganda words\" despite efforts by Tesla to promote such initiatives. The billionaire is chief executive officer and the largest shareholder of Tesla, the electric-vehicle maker whi…", url: nil, urlToImage: "https://static.toiimg.com/thumb/msid-106052706,width-1070,height-580,imgsize-790561,resizemode-75,overlay-toi_sw,pt-32,y_pad-40/photo.jpg", publishedAt: nil, content: nil, saved: false))
}
