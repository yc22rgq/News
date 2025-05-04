//
//  BookmarkServiceTests.swift
//  NewsTests
//
//  Created by Эдуард Кудянов on 4.05.25.
//

// Tests/Data/BookmarkServiceTests.swift

import XCTest
import CoreData
@testable import News

final class BookmarkServiceTests: XCTestCase {
    
    var sut: BookmarkService!
    var context: NSManagedObjectContext!
    
    override func setUp() {
        super.setUp()
        sut = BookmarkService()
    }
    
    override func tearDown() {
        sut = nil
        context = nil
        super.tearDown()
    }
    
    func makeSampleNews() -> News {
        return News(
            title: "Swift News",
            description: "Apple news",
            content: "Full article", author: "Apple",
            publishedAt: Date(), url: "https://apple.com/news",
            urlToImage: nil,
            sourceName: "Apple"
        )
    }
    
    func testAddBookmark_shouldAddOne() {
        let count = sut.fetchBookmarks().count
        let news = makeSampleNews()
        sut.save(news: news)
        
        let saved = sut.fetchBookmarks()
        XCTAssertEqual(saved.count, count + 1)
        
        sut.delete(news: news)
        let bookmarks = sut.fetchBookmarks()
        XCTAssertEqual(bookmarks.count, count)
    }
    
    func testIsBookmarked() {
        let news = makeSampleNews()
        sut.save(news: news)
        
        XCTAssertTrue(sut.isBookmarked(news: news))
    }
}
