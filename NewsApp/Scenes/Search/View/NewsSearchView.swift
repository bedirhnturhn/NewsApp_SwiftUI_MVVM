//
//  NewsSearchView.swift
//  NewsApp
//
//  Created by Bedirhan Turhan on 18.11.2023.
//

import SwiftUI

struct NewsSearchView: View {
    @State var searchText = ""
    
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
                    TextField("Search", text: $searchText)
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(Color.white)
                .clipShape(Capsule())
                .padding(.horizontal, 25)
                .shadow(color: Color.black.opacity(0.08), radius: 5, x: 5, y: 5)
                .shadow(color: Color.black.opacity(0.08), radius: 5, x: -5, y: -5)
                .padding(.top)
                
                if searchText.count >= 3 {
                    
                } else {
                    LazyVGrid(columns: columns,spacing: 24) {
                        ForEach(NewsCategories.allCases.indices) { index in
                            NewsCategoryView(category: NewsCategories.allCases[index])
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
    }
}
