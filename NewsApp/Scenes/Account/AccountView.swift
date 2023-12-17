//
//  AccountView.swift
//  NewsApp
//
//  Created by Bedirhan Turhan on 17.12.2023.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 12, content: {
            NavigationLink {
                SavedNewsView()
                    .environmentObject(SavedNewsVM())
                    .navigationTitle("Saved News")
            } label: {
                HStack {
                    Text("SAVED NEWS")
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "bookmark")
                        .foregroundColor(.white)
                }
                .padding()
                .accentColor(.white)
                .background(Color.mainBlue)
                .clipShape(RoundedRectangle(cornerRadius: 14.0, style: .continuous))
            }
            .frame(maxWidth: UIScreen.main.bounds.width)
            .padding()
            Spacer()
        })
    }
}

#Preview {
    AccountView()
}
