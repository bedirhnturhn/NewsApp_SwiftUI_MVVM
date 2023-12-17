//
//  NewsHomeView.swift
//  NewsApp
//
//  Created by Bedirhan Turhan on 12.11.2023.
//

import SwiftUI

struct NewsHomeView: View {
    
    @EnvironmentObject var viewModel: NewsHomeVM
    @Binding var showTabView: Bool
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            CarouselView()
                .environmentObject(viewModel)
            HStack {
                Text("Recommendation")
                    .font(.headline)
                Spacer()
                Button(action: {}) {
                    Text("View All")
                        .foregroundColor(.mainBlue)
                        .fontWeight(.medium)
                }
            }
            .padding(.horizontal)
            .padding(.top)
            VStack(alignment: .center, spacing: 12) {
                ForEach(viewModel.recommendationNews) { article in
                    NavigationLink {
                        NewsDetailView(article: article, saved: article.saved)
                    } label: {
                        NewsHomeRowView(article: article)
                    }
                }
            }.padding(10)
        }
        .onAppear {
            viewModel.fetchRecommendationNews()
        }
    }
}
