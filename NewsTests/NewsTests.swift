//
//  NewsTests.swift
//  NewsTests
//
//  Created by Эдуард Кудянов on 4.05.25.
//

import XCTest
@testable import News

final class NewsTests: XCTestCase {
    func testNewsURLValidity() {
        let news = News(title: "Title", description: "", content: nil, author: "", publishedAt: Date(), url: "https://google.com", urlToImage: nil, sourceName: "CNN")
        
        XCTAssertNotNil(URL(string: news.url))
    }
}
