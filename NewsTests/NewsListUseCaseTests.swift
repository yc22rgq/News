//
//  NewsListUseCaseTests.swift
//  NewsTests
//
//  Created by Эдуард Кудянов on 4.05.25.
//

import XCTest
@testable import News

final class NewsListUseCaseTests: XCTestCase {

    final class MockNewsRepository: NewsRepository {
        var mockResult: Result<[News], NetworkError> = .success([])

        func getTopHeadlines(category: String?, completion: @escaping (Result<[News], NetworkError>) -> Void) {
            completion(mockResult)
        }
    }

    func testUseCaseReturnsSuccess() {
        let mock = MockNewsRepository()
        mock.mockResult = .success([News(title: "Test", description: "Desc", content: nil, author: nil, publishedAt: Date(), url: "https://example.com/", urlToImage: nil, sourceName: "Mock")])
        
        let useCase = NewsListUseCase(repository: mock)
        
        let expectation = self.expectation(description: "Success Case")
        useCase.execute(category: "general") { result in
            switch result {
            case .success(let news):
                XCTAssertEqual(news.count, 1)
                XCTAssertEqual(news.first?.title, "Test")
            case .failure:
                XCTFail("Expected success")
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 2, handler: nil)
    }
}
