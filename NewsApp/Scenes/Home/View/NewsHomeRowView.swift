//
//  NewsHomeRowView.swift
//  NewsApp
//
//  Created by Bedirhan Turhan on 12.11.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsHomeRowView: View {
    
    let article: Article
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            WebImage(url: URL(string: article.urlToImage ?? ""))
                .resizable()
                .frame(width: 128, height: 128)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(8)
            VStack(alignment: .leading, spacing: 8) {
                Text(article.title ?? "")
                    .font(.title3)
                    .fontWeight(.bold)
                    .lineLimit(3)
                HStack(spacing: 4) {
                    Text(article.author ?? "Author")
                        .font(Font.system(size: 12))
                        .foregroundColor(.gray)
                    Circle()
                        .frame(width: 5, height: 5)
                        .foregroundColor(.gray)
                    Text("6 Hours ago")
                        .fontWeight(.regular)
                        .font(Font.system(size: 12))
                        .foregroundColor(.gray)
                }
                Spacer(minLength: 8)
            }
            .padding([.top, .leading], 12)
        }
        .cornerRadius(8)
    }
}

//struct NewsHomeRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsHomeRowView()
//    }
//}
