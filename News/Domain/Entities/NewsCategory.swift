//
//  NewsCategory.swift
//  News
//
//  Created by Эдуард Кудянов on 4.05.25.
//

import Foundation

enum NewsCategory: String, CaseIterable {
    case general = "General"
    case business = "Business"
    case technology = "Technology"
    case entertainment = "Entertainment"
    case health = "Health"
    case science = "Science"
    case sports = "Sports"
    
    var apiValue: String {
        return self.rawValue.lowercased()
    }
}
