//
//  NewsCategoryView.swift
//  NewsApp
//
//  Created by Bedirhan Turhan on 19.11.2023.
//

import SwiftUI

struct NewsCategoryView: View {
    
    var category: NewsCategories
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            Image(category.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 120)
                .cornerRadius(8)
            Text(category.title)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.gray)
        }
        .frame(width: screenWidth / 3)
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.08), radius: 5, x: 5, y: 5)
        .shadow(color: Color.black.opacity(0.08), radius: 5, x: -5, y: -5)
    }
}

struct NewsCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        NewsCategoryView(category: .business)
    }
}
