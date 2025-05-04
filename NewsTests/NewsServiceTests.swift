//
//  NewsServiceTests.swift
//  NewsTests
//
//  Created by Эдуард Кудянов on 4.05.25.
//

import XCTest
@testable import News

final class NewsServiceTests: XCTestCase {

    var service: NewsService!

    override func setUp() {
        super.setUp()
        service = NewsService()
    }

    func testFetchTopHeadlines() {
        let expectation = self.expectation(description: "Fetch headlines")
        
        service.fetchTopHeadlines(category: "general") { result in
            switch result {
            case .success(let news):
                XCTAssertFalse(news.isEmpty, "News array should not be empty")
            case .failure(let error):
                XCTFail("Expected success but got error: \(error)")
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFetchBusiness() {
        let expectation = self.expectation(description: "Fetch headlines")
        
        service.fetchTopHeadlines(category: "business") { result in
            switch result {
            case .success(let news):
                XCTAssertFalse(news.isEmpty, "News array should not be empty")
            case .failure(let error):
                XCTFail("Expected success but got error: \(error)")
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }
}
