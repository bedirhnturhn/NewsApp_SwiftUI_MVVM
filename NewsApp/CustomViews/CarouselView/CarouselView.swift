//
//  CarouselView.swift
//  NewsApp
//
//  Created by Bedirhan Turhan on 14.10.2023.
//

import SwiftUI

struct CarouselView: View {
    @State private var index = 0 {
        didSet {
            print(index)
        }
    }
    @EnvironmentObject var viewModel: NewsHomeVM
    var newsCount: Int {
        viewModel.breakingNews.count
    }
    
    var body: some View {
        VStack {
            TabView(selection: $index) {
                ForEach(0..<self.newsCount, id: \.self) { index in
                    NavigationLink {
                        NewsDetailView(article: viewModel.breakingNews[index], saved: viewModel.breakingNews[index].saved)
                    } label: {
                        CardView(article: viewModel.breakingNews[index])
                    }
                    .padding(.horizontal)
                }
            }
            .frame(height: 200)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            HStack(spacing: 2) {
                ForEach(0..<self.newsCount, id: \.self) { index in
                    let isSelected = index == self.index
                    Rectangle()
                        .fill(isSelected ? Color.mainBlue : Color.whiteGray)
                        .frame(height: 12)
                        .cornerRadius(6)
                        .frame(width: isSelected ? 36: 12)
                }
                .animation(.easeInOut,value: index)
            }
        }
        .padding(.top)
        .onAppear {
            viewModel.fetchNews()
        }
    }
}
//
//
//struct CarouselView_Previews: PreviewProvider {
//    static var previews: some View {
//        CarouselView()
//    }
//}
