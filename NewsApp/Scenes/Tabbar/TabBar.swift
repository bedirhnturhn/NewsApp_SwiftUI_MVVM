//
//  TabBar.swift
//  NewsApp
//
//  Created by Bedirhan Turhan on 18.10.2023.
//

import SwiftUI

struct TabBar: View {
    @State var current = "Home"
    @State var activeTab: MainTabs = .home
    @State var showTabView = true
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        NavigationView(content: {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                TabView(selection: $activeTab) {
                    NewsHomeView(showTabView: $showTabView)
                        .environmentObject(NewsHomeVM())
                        .tag(MainTabs.home)
                    NewsSearchView()
                        .environmentObject(SearchVM())
                        .tag(MainTabs.search)
                    Text("Account")
                        .tag(MainTabs.profile)
                }
                
                HStack(spacing: 0) {
                    ForEach(MainTabs.allCases, id: \.self) { tab in
                        TabButton(tabModel: tab, selected: $activeTab)
                        if MainTabs.allCases.last != tab {
                            Spacer(minLength: 0)
                        }
                    }
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(Color.white)
                .clipShape(Capsule())
                .padding(.horizontal, 25)
                .shadow(color: Color.black.opacity(0.08), radius: 5, x: 5, y: 5)
                .shadow(color: Color.black.opacity(0.08), radius: 5, x: -5, y: -5)
//                .isHidden(!showTabView)
            }
        })
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

import SwiftUI


extension View {
    
    /// Hide or show the view based on a boolean value.
    ///
    /// Example for visibility:
    ///
    ///     Text("Label")
    ///         .isHidden(true)
    ///
    /// Example for complete removal:
    ///
    ///     Text("Label")
    ///         .isHidden(true, remove: true)
    ///
    /// - Parameters:
    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
    ///   - remove: Boolean value indicating whether or not to remove the view.
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
