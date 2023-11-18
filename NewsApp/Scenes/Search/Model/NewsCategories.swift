//
//  NewsCategories.swift
//  NewsApp
//
//  Created by Bedirhan Turhan on 19.11.2023.
//

import Foundation

enum NewsCategories: CaseIterable {
    case general
    case business
    case health
    case entertainment
    case science
    case sports
    case technology
    
    var imageName: String {
        switch self {
        case .general:
            return "generalCategory"
        case .business:
            return "businessCategory"
        case .health:
            return "healthCategory"
        case .entertainment:
            return "entertainmentCategory"
        case .science:
            return "scienceCategory"
        case .sports:
            return "sportsCategory"
        case .technology:
            return "technologyCategory"
        }
    }
    
    var title: String {
        switch self {
        case .general:
            return "General"
        case .business:
            return "Business"
        case .health:
            return "Health"
        case .entertainment:
            return "Entertainment"
        case .science:
            return "Science"
        case .sports:
            return "Sports"
        case .technology:
            return "Technology"
        }
    }
}
