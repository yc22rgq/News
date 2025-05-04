//
//  NewsDetailViewModel.swift
//  News
//
//  Created by Эдуард Кудянов on 28.04.25.
//

// Presentation/Modules/NewsDetail/NewsDetailViewModel.swift

import Foundation

final class NewsDetailViewModel {
    
    private(set) var news: News
    private let bookmarkService = BookmarkService()
    
    init(news: News) {
        self.news = news
    }
    
    var isBookmarked: Bool {
        return bookmarkService.isBookmarked(news: news)
    }
    
    func toggleBookmark() {
        if isBookmarked {
            bookmarkService.delete(news: news)
        } else {
            bookmarkService.save(news: news)
        }
    }
}
