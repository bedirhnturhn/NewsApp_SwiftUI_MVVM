//
//  TabButton.swift
//  NewsApp
//
//  Created by Bedirhan Turhan on 18.10.2023.
//

import SwiftUI

struct TabButton: View {
    
    var tabModel: MainTabs
    
    @Binding var selected: MainTabs
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()){selected = tabModel}
        }) {
            HStack(spacing: 10) {
                Image(tabModel.image)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 25, height: 25)
                    .foregroundColor(selected == tabModel ? .white : .mainBlue)
                if selected == tabModel {
                    Text(tabModel.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(selected == tabModel ? Color.mainBlue : Color.white)
            .clipShape(Capsule())
        }
    }
}
//
//struct TabButton_Previews: PreviewProvider {
//    static var previews: some View {
//        TabButton(title: "Selam", image: "Selam", selected: "Selam")
//    }
//}
