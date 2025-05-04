//
//  BookmarksViewModel.swift
//  News
//
//  Created by Эдуард Кудянов on 28.04.25.
//

import Foundation

final class BookmarksViewModel {
    
    private let bookmarkService = BookmarkService()
    
    private(set) var bookmarks: [News] = []
    
    var onBookmarksUpdate: (() -> Void)?
    
    func fetchBookmarks() {
        bookmarks = bookmarkService.fetchBookmarks()
        onBookmarksUpdate?()
    }
    
    func getBookmark(at index: Int) -> News? {
        guard index >= 0 && index < bookmarks.count else { return nil }
        return bookmarks[index]
    }
}
