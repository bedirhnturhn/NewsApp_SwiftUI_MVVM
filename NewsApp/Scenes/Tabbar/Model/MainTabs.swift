//
//  MainTabs.swift
//  NewsApp
//
//  Created by Bedirhan Turhan on 18.11.2023.
//

import Foundation

enum MainTabs: CaseIterable {
    case home
    case search
    case profile
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .search:
            return "Search"
        case .profile:
            return "Profile"
        }
    }
    
    var image: String {
        switch self {
        case .home:
            return "home"
        case .search:
            return "feed"
        case .profile:
            return "account"
        }
    }
}
