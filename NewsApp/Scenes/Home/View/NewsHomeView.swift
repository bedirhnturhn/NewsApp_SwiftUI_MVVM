//
//  NewsHomeView.swift
//  NewsApp
//
//  Created by Bedirhan Turhan on 12.11.2023.
//

import SwiftUI

struct NewsHomeView: View {
    
    @EnvironmentObject var viewModel: NewsHomeVM
    
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
                    NewsHomeRowView(article: article)
                }
            }.padding()
        }
        .onAppear {
            viewModel.fetchRecommendationNews()
        }
    }
}

struct NewsHomeView_Previews: PreviewProvider {
    static var previews: some View {
        NewsHomeView()
    }
}

