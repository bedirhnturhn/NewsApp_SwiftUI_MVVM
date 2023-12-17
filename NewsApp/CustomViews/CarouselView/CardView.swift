//
//  CardView.swift
//  NewsApp
//
//  Created by Bedirhan Turhan on 8.10.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct CardView: View {
    
    let article: ArticleUIModel
    
    var body: some View {
        ZStack {
            WebImage(url: URL(string: article.urlToImage ?? ""))
                .resizable()
                
            
            Rectangle()
                .fill(Color.black)
                .opacity(0.3)
                
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text("News")
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .padding()
                Spacer()
                HStack(spacing: 4) {
                    Text(article.author ?? "")
                        .foregroundColor(.white)
                    Circle()
                        .frame(width: 5, height: 5)
                        .foregroundColor(.white)
                    Text("6 Hours Ago")
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding([.top, .leading], 12)
                Text(article.title ?? "")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding([.leading, .bottom, .trailing], 12)
            }
        }
        .cornerRadius(24)
    }
}
//
//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(model: nil)
//            .frame(height: 200)
//    }
//}
