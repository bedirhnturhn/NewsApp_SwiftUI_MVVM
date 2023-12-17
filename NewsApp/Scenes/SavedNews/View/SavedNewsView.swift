//
//  SavedNewsView.swift
//  NewsApp
//
//  Created by Bedirhan Turhan on 17.12.2023.
//

import SwiftUI

struct SavedNewsView: View {
    
    @EnvironmentObject var viewModel: SavedNewsVM
    
    var body: some View {
        ScrollView(.vertical) {
            if !viewModel.savedNews.isEmpty {
                VStack(alignment: .center, spacing: 12, content: {
                    ForEach(viewModel.savedNews) { article in
                        NavigationLink {
                            NewsDetailView(article: article, saved: article.saved)
                        } label: {
                            NewsHomeRowView(article: article)
                        }
                    }
                })
            } else {
                VStack(alignment: .center, spacing: 36, content: {
                    Spacer(minLength: UIScreen.main.bounds.height / 3)
                    Image(systemName: "bookmark.fill")
                        .foregroundColor(.black)
                    Text("Save the news so you can look at it again later.")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    Spacer()
                })
            }
        }
        .padding()
        .onAppear(perform: {
            viewModel.fetchNews()
        })
    }
}

#Preview {
    SavedNewsView()
        .environmentObject(SavedNewsVM())
}
